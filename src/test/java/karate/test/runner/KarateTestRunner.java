package karate.test.runner;

import com.intuit.karate.junit5.Karate;

public class KarateTestRunner {
	
	@Karate.Test
	public Karate runTest() {
		
		return Karate.run(".\\features")
				.tags("End2End");
}
}