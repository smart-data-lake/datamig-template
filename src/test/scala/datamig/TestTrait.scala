package datamig

import io.smartdatalake.util.spark.GetSession.loggEnv
import org.apache.spark.sql.{Dataset, SparkSession}
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers
import org.slf4j.Logger

trait TestTrait extends AnyFlatSpec with Matchers {

  private val epsilonDouble: Double = Math.scalb(1d, -16) // 2^(-16)
  private val epsilonFloat: Float   = Math.scalb(1f, -16) // 2^(-16)

  /** checks whether 2 values are almost equal
    *
    * @param epsilon
    *   maximal difference to be considered for equality
    * @param x
    *   first value
    * @param y
    *   second value
    * @param relative
    *   if true then comparison is done with respect to value of the first argument
    * @param num
    *   implicit proof that type A is numeric
    * @tparam A
    *   type of values x and y
    * @return
    *   boolean telling you whether x and y are considered to equal
    */
  def almostEqual[A](epsilon: A, x: A, y: A, relative: Boolean = false)(implicit
      num: Numeric[A]
  ): Boolean = {
    val maxDiff = if (relative) num.times(num.abs(x), epsilon) else epsilon
    num.lt(num.abs(num.minus(x, y)), maxDiff)
  }

  def anyEqual(x: Any, y: Any): Boolean = x match {
    // Numeric values
    case x: Double    => almostEqual(epsilonDouble, x, y.asInstanceOf[Double]) ||
      (x.isNaN && y.asInstanceOf[Double].isNaN) ||
      (x.isPosInfinity && y.asInstanceOf[Double].isPosInfinity) ||
      (x.isNegInfinity && y.asInstanceOf[Double].isNegInfinity)
    case x: Float     => almostEqual(epsilonFloat, x, y.asInstanceOf[Float]) ||
      (x.isNaN && y.asInstanceOf[Float].isNaN) ||
      (x.isPosInfinity && y.asInstanceOf[Float].isPosInfinity) ||
      (x.isNegInfinity && y.asInstanceOf[Float].isNegInfinity)
    case x: Array[_]  => y match {
        case y: Array[_] => (x.length == y.length) && x.zip(y).forall(xy => anyEqual(xy._1, xy._2))
        case _           => false
      }
    // optional values
    case x: Option[_] => y match {
        case y: Option[_] => (x.isEmpty && y.isEmpty) || x.zip(y)
            .exists(xy => anyEqual(xy._1, xy._2))
        case _            => false
      }
    // collections
    case x: Seq[_]    => y match {
        case y: Seq[_] => (x.size == y.size) && x.zip(y).forall(xy => anyEqual(xy._1, xy._2))
        case _         => false
      }
    case x: (_, _)    => y match {
        case y: (_, _) => anyEqual(x._1, y._1) && anyEqual(x._2, y._2)
        case _         => false
      }
    case _            => x == y
  }

  /** testArgumentExpectedMap writes a log message in case the expected value does not equal the
    * actual
    *
    * @param experiendum
    *   map you want to test
    * @param argExpMap
    *   map of (comment, input) -> expected output of provided map
    * @param logger
    *   to write nice messages
    * @tparam K
    *   type of input values of map to test
    * @tparam V
    *   type of output values of map to test
    * @return
    *   booleans which indicate whether tests were successful
    */
  def testArgumentExpectedMap[K, V](experiendum: K => V, argExpMap: Map[K, V])(implicit
      logger: Logger
  ): Map[K, Boolean] = {
    def addEmptyComment(x: (K, V)): ((String, K), V) = x match { case (k, v) => (("", k), v) }

    val argExpMapWithReason: Map[(String, K), V] = argExpMap.map(addEmptyComment)
    testArgumentExpectedMapWithComment(experiendum, argExpMapWithReason).map { case (k, v) =>
      (k._2, v)
    }
  }

  /** testArgumentExpectedMapWithComment writes a log message decorated with provided comment in
    * case the expected value does not equal the actual
    *
    * @param experiendum
    *   map you want to test
    * @param argExpMapComm
    *   map of (comment, input) -> expected output of provided map
    * @param logger
    *   to write nice messages
    * @tparam K
    *   type of input values of map to test
    * @tparam V
    *   type of output values of map to test
    * @return
    *   booleans which indicate whether tests were successful
    */
  def testArgumentExpectedMapWithComment[K, V](
      experiendum: K => V,
      argExpMapComm: Map[(String, K), V]
  )(implicit logger: Logger): Map[(String, K), Boolean] = {
    def logFailureObject(argName: String, x: Any): Unit = {
      val printPrefix = s"   ${argName.padTo(8, " ").mkString("")} = "
      x match {
        case df: Dataset[_] =>
          logger.error(printPrefix)
          df.show(false)
        case x: Array[_]    => logger.error(s"$printPrefix${x.mkString(", ")}")
        case x: Seq[_]      => logger.error(s"$printPrefix${x.mkString(", ")}")
        // case x: scala.collection.GenSeq[_] => logger.error(s"$printPrefix${x.mkString(", ")}")
        case _              => logger.error(s"$printPrefix${x.toString}")
      }
    }

    def logFailure(argument: K, actual: V, expected: V, comment: String): Unit = {
      logger.error("Test case failed !")
      logFailureObject("argument", argument)
      logFailureObject("actual", actual)
      logFailureObject("expected", expected)
      if (comment.nonEmpty) logFailureObject("comment", comment)
    }

    def checkKey(x: (String, K)): Boolean = x match {
      case (comment, argument) =>
        val actual   = experiendum(argument)
        val expected = argExpMapComm(x)
        val resultat = anyEqual(actual, expected)
        if (!resultat) logFailure(argument, actual, expected, comment)
        resultat
      case _ => throw new Exception(s"Something went wrong: checkKey called with parameter x=$x")
    }

    argExpMapComm.map { case (ck, _) => (ck, checkKey(ck)) }
  }

  /** only return SessionBuilder, this allows to modify config Even if IntelliJ recommends so, do
    * not make it private so that we can play with ith.
    *
    * @param nCores
    *   how many cores do you want
    */
  def sessionBuilder(nCores: Int = 1): SparkSession.Builder = SparkSession.builder()
    .appName("UnitTest").master(s"local[$nCores]")
    // performance tuning
    .config("spark.sql.shuffle.partitions", nCores).config("spark.ui.enabled", value = false)
    // avoid timeout during debugging with breakpoints
    .config("spark.network.timeout", "3600s").config("spark.executor.heartbeatInterval", "120s")

  def createSparkSession(nCores: Int = 1)(implicit logger: Logger): SparkSession = {
    val newSparkSession = sessionBuilder(nCores).getOrCreate()
    loggEnv(newSparkSession, logger)
    newSparkSession
  }

}
