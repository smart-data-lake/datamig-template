package ch.datamig.load

import ch.datamig.quality.getData
import io.smartdatalake.util.misc.SmartDataLakeLogger
import io.smartdatalake.util.spark.dataset
import io.smartdatalake.util.spark.GetSession.loggEnv
import io.smartdatalake.workflow.action.spark.customlogic.CustomDfsTransformer
import org.apache.spark.sql.{DataFrame, SparkSession}
import org.apache.spark.sql.functions._
import org.slf4j.Logger

class CountryRegionTransformer
    extends CustomDfsTransformer with SmartDataLakeLogger with dataset.Quality with Serializable {
  override def transform(
      session: SparkSession,
      options: Map[String, String],
      dfs: Map[String, DataFrame]
  ): Map[String, DataFrame] = {
    import session.implicits._
    implicit val loggerImpl: Logger              = logger
    implicit val implSession: SparkSession       = session
    implicit val implDfs: Map[String, DataFrame] = dfs
    val countryFilter                            = expr(options.getOrElse("country-filter", "true"))

    logger.info(s"*** Start CountryRegionTransformer : countryFilter = $countryFilter")
    loggEnv

    val dfCountryRegion = getData(dataObject = "datamig_src_country_region", filter = countryFilter)

    val dfCountry = dfCountryRegion.select($"iso_3166_1", $"country_name").distinct()
    dfCountry.createdLog(dsName = "dfCountry")

    val dfRegion = dfCountryRegion.select($"iso_3166_1", $"iso_3166_2", $"region_name")
    dfRegion.createdLog(dsName = "dfRegion")

    Map("datamig_tgt_country" -> dfCountry, "datamig_tgt_region" -> dfRegion)
  }
}
