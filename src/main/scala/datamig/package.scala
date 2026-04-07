import org.apache.spark.sql.{Column, DataFrame, Dataset}
import org.apache.spark.sql.functions._

package object datamig extends Serializable {

  val reasonColName: String = "reason"
  val reasonCol: Column     = col(reasonColName)

  val srcColMap: Map[String, List[SrcCol]] = Map(
    "src_country_region" -> List(
      SrcCol(name = "iso_3166_1", newName = "iso_3166_1"),
      SrcCol(name = "country_name", newName = "country_name"),
      SrcCol(name = "iso_3166_2", newName = "iso_3166_2"),
      SrcCol(name = "region_name", newName = "region_name")
    )
  )

  implicit class DsError[T](ds: Dataset[T]) extends Serializable {

    lazy val aggregateReasonCol: DataFrame =
      if (ds.columns.contains(reasonColName)) {
        val grpByCols = ds.columns.diff(Array(reasonColName)).map(col)
        ds.groupBy(grpByCols: _*).agg(expr = array_sort(collect_set(reasonCol)).as(reasonColName))
          .select(
            grpByCols :+ regexp_replace(
              e = reduce(
                expr = reasonCol,
                initialValue = lit(""),
                merge = (acc, x) => concat_ws(" ; ", acc, x)
              ),
              pattern = "^ ; ",
              replacement = ""
            ).as(reasonColName): _*
          )
      } else ds.asInstanceOf[DataFrame]

  }

}
