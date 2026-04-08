package ch.datamig.quality

import org.apache.spark.sql.Column

/** @param criterion
  *   boolean valued udf
  * @param violationMessage
  *   message to write into error table if invalid
  */
case class QualityCheck(criterion: Column, violationMessage: String) {
  override def toString: String = s"QualityCheck(criterion: ${criterion.toString()} ," +
    s" violationMessage=\"$violationMessage\")"
}
