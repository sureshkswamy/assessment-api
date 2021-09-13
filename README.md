
Containerized sample API Automation project using Karate automation framework.

System requirements: 
  Install Docker on local
  
Execution on local:

	1. Clone this repo to local
	
	2. Create test results folder on local
	
	3. From CLI - project directory execute docker build and run commands
	
	4. During docker run, mount local results directory with container results directory (/testresults/cucumber-html-reports) as below
		- docker run -v <local results dir>:/testresults/cucumber-html-reports <docker image name>
  
Assumptions:
	**All responses from POST API are assumed as expected behavior and all assertions in tests are based on this output**
	
Test details:

	1.Total 20 automation scripts are created for the post request including a sample for data driven testing
	
	2. Docker run creates folder "cucumber-html-reports" under local results directory created in previous steps
	
	3. HTML file "overview-features.html" in "cucumber-html-reports" folder is the comprehensive test report of all test scenarios
	
	4. Assertions are based on http status code, content from response body like errorCode, message, totalCount, etc.
	
	5. Tests are created for each element/node of post request for both valid and invalid data
  
Sample assertions:
	
	* match responseStatus == 200
	* match response.code == 200
	* match response.page.currentPage == testData.currentPage
	* match response.page.itemPerPage == testData.itemPerPage
	* match response.page.totalPage == '#notnull'
	* match response.page.totalPage == '#number'
	* match response.page.totalCount == '#notnull'
	* match response.page.totalCount == '#number' 
	* match response.message == 'Invalid numeric operator'
	* match response.errorCode == 400001
