package ch.datamig.load

import ch.datamig.generatePKcol
import ch.datamig.quality.getData
import io.smartdatalake.util.misc.SmartDataLakeLogger
import io.smartdatalake.util.spark.dataset
import io.smartdatalake.util.spark.GetSession.loggEnv
import io.smartdatalake.workflow.action.spark.customlogic.CustomDfsTransformer
import org.apache.spark.sql.{DataFrame, SparkSession}
import org.slf4j.Logger

class CitiesTransformer
    extends CustomDfsTransformer with SmartDataLakeLogger with dataset.Quality with Serializable {
  override def transform(
      session: SparkSession,
      options: Map[String, String],
      dfs: Map[String, DataFrame]
  ): Map[String, DataFrame] = {
    implicit val loggerImpl: Logger              = logger
    implicit val implSession: SparkSession       = session
    implicit val implDfs: Map[String, DataFrame] = dfs
    import session.implicits._
    logger.info(s"*** Start CitiesTransformer")
    loggEnv

    val dfCities = getData(dataObject = "datamig_src_cities")
      .join(getData(dataObject = "datamig_tgt_region"), List("iso_3166_1", "region_name"), "inner")
      .select(
        generatePKcol(orderColNames = List("iso_3166_1", "iso_3166_2", "city_name")),
        $"city_name",
        $"city_ascii",
        $"population",
        $"latitude",
        $"longitude",
        $"iso_3166_1",
        $"iso_3166_2"
      )
    dfCities.createdLog(dsName = "dfCities")

    Map("datamig_tgt_cities" -> dfCities)
  }
}
