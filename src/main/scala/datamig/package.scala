import datamig.quality.strNotTooLongQC
import org.apache.spark.sql.{Column, DataFrame, Dataset}
import org.apache.spark.sql.expressions.Window
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types.{FloatType, IntegerType, LongType}
package object datamig extends Serializable {

  def shortenString(length: Int)(c: Column): Column =
    substr(str = c, pos = lit(1), len = lit(length))

  val srcColMap: Map[String, List[SrcCol]] = Map(
    "src_cities"         -> List(
      SrcCol(
        name = "city",
        newName = "city_name",
        transformation = trim,
        qualityCheck = Some(strNotTooLongQC(maxLength = 16))
      ),
      SrcCol(
        name = "city_ascii",
        newName = "city_ascii",
        transformation = trim,
        qualityCheck = Some(strNotTooLongQC(maxLength = 16))
      ),
      SrcCol(name = "latitude", newName = "latitude", newType = FloatType),
      SrcCol(name = "longitude", newName = "longitude", newType = FloatType),
      SrcCol(name = "iso2", newName = "iso_3166_1"),
      SrcCol(name = "region_name", newName = "region_name"),
      SrcCol(name = "population", newName = "population", newType = IntegerType),
      SrcCol(name = "id", newName = "id")
    ),
    "src_country_region" -> List(
      SrcCol(name = "iso_3166_1", newName = "iso_3166_1"),
      SrcCol(name = "country_name", newName = "country_name"),
      SrcCol(name = "iso_3166_2", newName = "iso_3166_2"),
      SrcCol(name = "region_name", newName = "region_name")
    ),
    "tgt_region"         -> List(
      SrcCol(name = "iso_3166_1", newName = "iso_3166_1"),
      SrcCol(name = "iso_3166_2", newName = "iso_3166_2"),
      SrcCol(name = "region_name", newName = "region_name")
    )
  )

  def generatePKcol(
      orderColNames: Seq[String],
      pkColname: String = "id",
      startValue: Long = 0L
  ): Column =
    (lit(startValue) - row_number().over(Window.orderBy(orderColNames.map(col(_).desc): _*))
      .cast(LongType)).as(pkColname)

}
