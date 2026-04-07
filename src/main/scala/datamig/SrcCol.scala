package datamig

import datamig.quality.QualityCheck
import org.apache.spark.sql.types.{DataType, StringType}
import org.apache.spark.sql.Column

/** @param name
  *   name of column
  * @param newName
  *   what to be renamed to
  * @param newType
  *   which data type to be casted
  * @param qualityCheck
  *   quality criteriae to comply with
  */
case class SrcCol(
    name: String,
    newName: String,
    newType: DataType = StringType,
    transformation: Column => Column = identity,
    qualityCheck: Option[String => QualityCheck] = None
) {
  override def toString: String =
    s"SrcCol(name=\"$name\" , newName=\"$newName\" , newType=${newType.toString} ," +
      s" qualityCheck=${qualityCheck.map(_(name).toString)})"
}
