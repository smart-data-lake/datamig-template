package datamig.quality

import datamig.{reasonCol, reasonColName, srcColMap, DsError, SrcCol}
import io.smartdatalake.util.spark.dataset
import io.smartdatalake.util.LogUtils.debugLog
import java.lang.Character.isDigit
import org.apache.spark.sql.{Column, DataFrame, SparkSession}
import org.apache.spark.sql.functions.{col, lit, not, udf}
import org.slf4j.Logger

object Quality extends dataset.Quality {

  /** @param strOpt
    *   optional string to test
    * @return
    *   true if strOpt is None or contains a natural number
    */
  def strIsNat(strOpt: Option[String]): Boolean = strOpt.forall(_.forall(isDigit))

  def strIsNatQC(colName: String): QualityCheck = {
    val fun = udf(strIsNat _)
    QualityCheck(
      criterion = fun(col(colName)).as(s"check_$colName"),
      violationMessage = s"column $colName cannot be casted to nat"
    )
  }

  /** @param strOpt
    *   optional string to test
    * @return
    *   true if strOpt is None or contains a number
    */
  def strIsNumeric(strOpt: Option[String]): Boolean = strOpt.forall { str =>
    (isDigit(str(0)) || str(0) == '-') && str.tail.split('.').forall(_.forall(isDigit))
  }

  def strIsNumericQC(colName: String): QualityCheck = {
    val fun = udf(strIsNumeric _)
    QualityCheck(
      criterion = fun(col(colName)).as(s"check_$colName"),
      violationMessage = s"column $colName cannot be casted to number"
    )
  }

  def dummyFalseQC(colName: String): QualityCheck = QualityCheck(
    criterion = lit(false).as(s"check_$colName"),
    violationMessage = s"column $colName does not satisfy test criterium of falsehood."
  )

  /** @param maxLength
    *   maximal allowed length
    * @param strOpt
    *   optional string to test
    * @return
    *   true if strOpt is None or contains a stringnot longer than maxLength
    */
  def strNotTooLong(maxLength: Int)(strOpt: Option[String]): Boolean = strOpt
    .forall(_.length <= maxLength)

  def strNotTooLongQC(maxLength: Int)(colName: String): QualityCheck = {
    val fun = udf(strNotTooLong(maxLength) _)
    QualityCheck(
      criterion = fun(col(colName)).as(s"check_$colName"),
      violationMessage = s"string in column $colName is longer than $maxLength"
    )
  }

  /** @param df
    *   DataFrame contanin all data and all columns
    * @param srcCols
    *   Seq od source columns containing renaming, data casts and quality checks
    * @param additionalChecks
    *   additional checks to perform
    * @param validOpt
    *   do you want the valid or invalid rows, or even all rows ? None => returning all rows, but
    *   just columns as keys in srcColMap Some(false) => returning invalid rows only, adding column
    *   $reasonCol to indicate reason for invalidity Some(true) => returning valid rows only,
    *   applying transformation, type cast and renaming according to srcColMap
    * @param logger
    *   to write nice messages
    * @param sparkSession
    *   the session to spark
    * @return
    *   dataFrame of valid or invalid records. In case of invalid including a reason column
    */
  def getDataFromDf(
      df: DataFrame,
      srcCols: Seq[SrcCol],
      additionalChecks: Map[String, QualityCheck] = Map.empty[String, QualityCheck],
      validOpt: Option[Boolean] = Some(true)
  )(implicit logger: Logger, sparkSession: SparkSession): DataFrame = {
    val logPrefix = s"getDataFromDf(validOpt=$validOpt):"
    logger.info(s"$logPrefix ${srcCols.size} srcCols:\n ${srcCols.mkString("\n ")}")

    // generating boolean valued filter column
    val qualityChecks: Seq[(Column, Column)] = srcCols.filterNot(_.qualityCheck.isEmpty).map { sc =>
      val quCheck: QualityCheck = sc.qualityCheck.get(sc.name)
      (quCheck.criterion, lit(quCheck.violationMessage))
    } ++ additionalChecks.map { case (colName, qc) =>
      (qc.criterion(col(colName)), lit(qc.violationMessage))
    }
    logger.info(s"$logPrefix ${qualityChecks.size} qualityChecks:\n${qualityChecks.mkString("\n")}")
    val qualityFilter: Column = qualityChecks.foldLeft(lit(true)) { case (accCol, qc) =>
      accCol and qc._1
    }
    logger.info(s"$logPrefix qualityFilter: $qualityFilter")

    validOpt match {
      case None       =>
        debugLog(s"$logPrefix returning all rows, but just columns as keys in srcColMap")
        df.select(srcCols.map { sc => col(sc.name) }: _*)
      case Some(true) =>
        debugLog(
          s"$logPrefix returning valid rows only" +
            s" while applying transformation, type cast and renaming according to srcColMap"
        )
        debugLog(s"$logPrefix original df.count = ${df.count()}")
        df.where(qualityFilter).select(srcCols.map { sc =>
          sc.transformation(col(sc.name)).cast(sc.newType).as(sc.newName)
        }: _*)
      case _          =>
        debugLog(
          s"$logPrefix returning invalid rows only, adding column $reasonCol to indicate reason for invalidity"
        )
        debugLog(s"$logPrefix original df.count = ${df.count()}")
        qualityChecks.foldLeft(df.withColumn(reasonColName, lit("")).where(lit(false))) {
          // qc._1: boolean valued column containing test criterium , qc._2: violation message
          case (accDf, qc: (Column, Column)) => accDf
              .union(df.where(not(qc._1)).withColumn(reasonColName, lit(qc._2)))
        }.select(srcCols.map { sc => col(sc.name) } :+ reasonCol: _*)
    }

  }

  /** @param dataObject
    *   name of dataObject
    * @param additionalChecks
    *   additional checks to perform
    * @param validOpt
    *   do you want the valid or invalid rows
    * @param filter
    *   overall data filter to be applied first to dataObject
    * @param dfs
    *   implicit mapping of dataObjects
    * @param logger
    *   to write nice messages
    * @param sparkSession
    *   the session to spark
    * @return
    *   dataFrame of valid or invalid records. In case of invalid including a reason column
    */
  def getData(
      dataObject: String,
      additionalChecks: Map[String, QualityCheck] = Map.empty[String, QualityCheck],
      validOpt: Option[Boolean] = Some(true),
      filter: Column = lit(true)
  )(implicit dfs: Map[String, DataFrame], logger: Logger, sparkSession: SparkSession): DataFrame = {
    logger.info(
      s"getData: dataObject=$dataObject , validOpt=$validOpt , filter=$filter ," +
        s" ${additionalChecks.size} additionalChecks"
    )
    getDataFromDf(
      df = dfs(dataObject).where(filter),
      srcCols = srcColMap(dataObject),
      additionalChecks = additionalChecks,
      validOpt = validOpt
    )
  }

  /** @param dataObject
    *   name of dataObject
    * @param additionalChecks
    *   additional checks to perform
    * @param dfs
    *   implicit mapping of dataObjects
    * @param logger
    *   to write nice messages
    * @param sparkSession
    *   the session to spark
    * @return
    *   dataFrame of invalid records including a reason column
    */
  def getInvalidWithReason(
      dataObject: String,
      additionalChecks: Map[String, QualityCheck] = Map.empty[String, QualityCheck],
      filter: Column = lit(true)
  )(implicit dfs: Map[String, DataFrame], logger: Logger, sparkSession: SparkSession): DataFrame = {
    val dfInvalid: DataFrame = getData(dataObject, additionalChecks, validOpt = Some(false), filter)
      .aggregateReasonCol
    dfInvalid.createdLog("dfInvalid")
    debugLog(s"getInvalidWithReason($dataObject): ${dfInvalid.count()} invalid records found")
    dfInvalid
  }

}
