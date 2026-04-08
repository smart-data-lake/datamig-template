package ch.datamig

import io.smartdatalake.testutils.TestTool
import io.smartdatalake.util.spark.dataset.Equality
import io.smartdatalake.util.spark.GetSession.createSparkSession
import org.apache.spark.sql.SparkSession
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import org.slf4j.{Logger, LoggerFactory}

class DatamigTest extends AnyFlatSpec with Matchers with TestTool with Equality {
  private implicit val logger: Logger          = LoggerFactory.getLogger(getClass.getName)
  private implicit val sparkImpl: SparkSession = createSparkSession()

  import sparkImpl.implicits._

  private val myDf = List((0, None), (1, Some("a")), (2, Some("ab")), (3, Some("abc")))
    .toDF("id", "text")

  "shortenString" should "shorten the string" in {
    val actual   = myDf.withColumn("text_short", shortenString(2)($"text"))
    val expected = List(
      (0, None, None),
      (1, Some("a"), Some("a")),
      (2, Some("ab"), Some("ab")),
      (3, Some("abc"), Some("ab"))
    ).toDF("id", "text", "text_short")
    actual.equal(expected) shouldBe true
  }

}
