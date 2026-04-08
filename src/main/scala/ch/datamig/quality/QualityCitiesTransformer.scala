package ch.datamig.quality

import io.smartdatalake.util.misc.SmartDataLakeLogger
import io.smartdatalake.util.spark.dataset
import io.smartdatalake.util.spark.GetSession.loggEnv
import io.smartdatalake.workflow.action.spark.customlogic.CustomDfsTransformer
import org.apache.spark.sql.{DataFrame, SparkSession}
import org.apache.spark.sql.functions.lit
import org.slf4j.Logger

class QualityCitiesTransformer
    extends CustomDfsTransformer with SmartDataLakeLogger with dataset.Quality with Serializable {

  override def transform(
      session: SparkSession,
      options: Map[String, String],
      dfs: Map[String, DataFrame]
  ): Map[String, DataFrame] = {
    implicit val loggerImpl: Logger              = logger
    implicit val implSession: SparkSession       = session
    implicit val implDfs: Map[String, DataFrame] = dfs

    logger.info(s"*** Start QualityCitiesTransformer ***")
    loggEnv

    val dfRegionNotFound = getData(dataObject = "src_cities", validOpt = None).join(
      getData(dataObject = "tgt_region").withColumnRenamed("iso_3166_1", "iso2"),
      List("iso2", "region_name"),
      "left_anti"
    ).withColumn(reasonColName, lit("region not found in look-up-table tgt_region"))
    dfRegionNotFound.createdLog("dfRegionNotFound")

    val dfCitiesError = getInvalidWithReason(dataObject = "src_cities")
      .unionByName(other = dfRegionNotFound, allowMissingColumns = false)
    dfCitiesError.createdLog("dfCitiesError")
    logger.info(s"dfCitiesError.count = ${dfCitiesError.count()}")
    Map("error_cities" -> dfCitiesError)
  }
}
