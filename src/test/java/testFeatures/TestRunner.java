package testFeatures;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    @Karate.Test
    Karate executeTests() {
        return Karate.run().relativeTo(getClass());
    }
}
