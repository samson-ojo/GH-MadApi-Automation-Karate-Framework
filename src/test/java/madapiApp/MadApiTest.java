package madapiApp;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
/* 
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import com.intuit.karate.FileUtils;
import org.junit.jupiter.api.BeforeAll;*/
//import org.apache.commons.io.FileUtils;
//import com.jayway.jsonpath.Configuration;
//import com.github.javafaker.File;
//import static org.junit.jupiter.api.Assertions.assertEquals;

class MadApiTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:madapiApp")
                //.outputCucumberJson(true)
                .parallel(5);
                //generateReport(results.getReportDir());
                //assertTrue(results.getFailCount() == 0, results.getErrorMessages());
                
                assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
/* 
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "conduitApp");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
*/
}
