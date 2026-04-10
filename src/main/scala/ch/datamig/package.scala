package ch

import ch.datamig.quality.strNotTooLongQC
import org.apache.spark.sql.expressions.Window
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types.{FloatType, IntegerType, LongType}
import org.apache.spark.sql.Column

package object datamig {

  def shortenString(length: Int)(c: Column): Column =
    substr(str = c, pos = lit(1), len = lit(length))

  val srcColMap: Map[String, List[SrcCol]] = Map(
    "src_cities"         -> List(
      SrcCol(
        name = "city",
        newName = Some("city_name"),
        transformation = trim,
        qualityCheck = Some(strNotTooLongQC(maxLength = 16))
      ),
      SrcCol(
        name = "city_ascii",
        transformation = trim,
        qualityCheck = Some(strNotTooLongQC(maxLength = 16))
      ),
      SrcCol(name = "latitude"),
      SrcCol(name = "longitude"),
      SrcCol(name = "iso2", newName = Some("iso_3166_1")),
      SrcCol(name = "region_name"),
      SrcCol(name = "population"),
      SrcCol(name = "id")
    ),
    "src_country_region" -> List(
      SrcCol(name = "iso_3166_1"),
      SrcCol(name = "country_name"),
      SrcCol(name = "iso_3166_2"),
      SrcCol(name = "region_name")
    ),
    "tgt_region"         ->
      List(SrcCol(name = "iso_3166_1"), SrcCol(name = "iso_3166_2"), SrcCol(name = "region_name"))
  )

  def generatePKcol(
      orderColNames: Seq[String],
      pkColname: String = "id",
      startValue: Long = 0L
  ): Column =
    (lit(startValue) - row_number().over(Window.orderBy(orderColNames.map(col(_).desc): _*))
      .cast(LongType)).as(pkColname)

}
