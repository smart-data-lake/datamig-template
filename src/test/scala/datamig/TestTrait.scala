package datamig

import io.smartdatalake.util.spark.GetSession.loggEnv
import org.apache.spark.sql.{Dataset, SparkSession}
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import org.slf4j.Logger

trait TestTrait extends AnyFlatSpec with Matchers {

  protected val myData = List((0, None), (1, Some("a")), (2, Some("ab")), (3, Some("abc")))

  private val epsilonDouble: Double = Math.scalb(1d, -16) // 2^(-16)
  private val epsilonFloat: Float   = Math.scalb(1f, -16) // 2^(-16)

}
