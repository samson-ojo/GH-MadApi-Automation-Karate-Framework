package performance;

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerfTest extends Simulation {

  
      
    val protocol = karateProtocol()

    //protocol.nameResolver = (req, ctx) -> req.getHeader("karate-name");
   // protocol.runner.karateEnv("perf");

//val csvFeeder = csv("userProfile.csv").queue

    val SignUpScenario = scenario("SignUp and Validate Signup error").exec(karateFeature("classpath:madapiApp/performance/SignUp.feature"))


    setUp(
      SignUpScenario.inject(
        atOnceUsers(1),
        nothingFor(4),
        constantUsersPerSec(1).during(4 seconds),
        // constantUsersPerSec(2).during(10 seconds),
        // rampUsersPerSec(2).to(10).during(20 seconds),
        // nothingFor(5 seconds),
        // constantUsersPerSec(2).during(10 seconds),
        ).protocols(protocol)
    );
  }
