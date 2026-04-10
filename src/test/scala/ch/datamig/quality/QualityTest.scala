package ch.datamig.quality

import ch.datamig.SrcCol
import io.smartdatalake.testutils.TestTool
import io.smartdatalake.util.spark.GetSession.createSparkSession
import org.apache.spark.sql.types.LongType
import org.apache.spark.sql.SparkSession
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import org.slf4j.{Logger, LoggerFactory}
class QualityTest extends AnyFlatSpec with Matchers with TestTool {
  private implicit val logger: Logger          = LoggerFactory.getLogger(getClass.getName)
  private implicit val sparkImpl: SparkSession = createSparkSession()

  import sparkImpl.implicits._

  private val myDf      = List((0, None), (1, Some("a")), (2, Some("ab")), (3, Some("abc")))
    .toDF("id", "text")
  private val mySrcCols = List(
    SrcCol(name = "id", newType = Some(LongType)),
    SrcCol(name = "text", qualityCheck = Some(strNotTooLongQC(maxLength = 2)))
  )

  "strIsNat" should "check whether a string can be converted to a natural number" in {
    val argExpMap: Map[(String, Option[String]), Boolean] = Map(
      ("null", None)                                                 -> true,
      ("zero", Some("0"))                                            -> true,
      ("the answer to everything", Some("42"))                       -> true,
      ("-1 is not a natural number", Some("-1"))                     -> false,
      ("double is not a natural number", Some("-1.23"))              -> false,
      ("date is not a natural number", Some("2025-12-06"))           -> false,
      ("\"hello word\" is not a natural number", Some("hello word")) -> false
    )
    testArgumentExpectedMapWithComment(strIsNat, argExpMap).values
      .forall(identity[Boolean]) shouldBe true
  }

  "strIsNumeric" should "check whether a string can be converted to a number" in {
    val argExpMap: Map[(String, Option[String]), Boolean] = Map(
      ("null", None)                                                 -> true,
      ("zero", Some("0"))                                            -> true,
      ("the answer to everything", Some("42"))                       -> true,
      ("-1 is a number", Some("-1"))                                 -> true,
      ("-1.23 is a number", Some("-1.23"))                           -> true,
      ("date is not a natural number", Some("2025-12-06"))           -> false,
      ("\"hello word\" is not a natural number", Some("hello word")) -> false
    )
    testArgumentExpectedMapWithComment(strIsNumeric, argExpMap).values
      .forall(identity[Boolean]) shouldBe true
  }

  "strNotTooLong" should "check whether a string is not too long" in {
    val argExpMap: Map[(Int, Option[String]), Boolean] = Map(
      (3, None)         -> true,
      (3, Some(""))     -> true,
      (3, Some("a"))    -> true,
      (3, Some("ab"))   -> true,
      (3, Some("abc"))  -> true,
      (3, Some("abcd")) -> false
    )
    val testFun: ((Int, Option[String])) => Boolean    = { case (maxLen, strOpt) =>
      strNotTooLong(maxLen)(strOpt)
    }
    testArgumentExpectedMap(testFun, argExpMap).values.forall(identity[Boolean]) shouldBe true
  }

  "getDataFromDf" should "select valid data only" in {
    val actual = getDataFromDf(df = myDf, srcCols = mySrcCols).select($"id").orderBy($"id").as[Long]
      .collect()
    actual shouldBe Array(0L, 1L, 2L)
  }

  "getDataFromDf" should "select invalid data only" in {
    val actual = getDataFromDf(df = myDf, srcCols = mySrcCols, validOpt = Some(false)).select($"id")
      .orderBy($"id").as[Long].collect()
    actual shouldBe Array(3L)
  }

  "getDataFromDf" should "select all data" in {
    val actual = getDataFromDf(df = myDf, srcCols = mySrcCols, validOpt = None).select($"id")
      .orderBy($"id").as[Long].collect()
    actual shouldBe Array(0L, 1L, 2L, 3L)
  }

}
