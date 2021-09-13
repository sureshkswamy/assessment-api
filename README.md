Containerized sample API Automation project using Karate automation framework.

System requirements: 
  Install Docker on local
  
Execution on local:
  Clone this repo to local
  Create test results folder on local
  From CLI - project directory execute docker build and run commands
  During docker run, mount local results directory with container results directory (/testresults/cucumber-html-reports) as below
    - docker run -v <local results dir>:/testresults/cucumber-html-reports <docker image name>
  
  Assumptions:
    All responses from POST API are assumed as expected behavior and all assertions in tests are based on this output
  
  Test details:
    Total 20 automation scripts are created for the post request including a sample for data driven testing
    Docker run creates folder "cucumber-html-reports" under local results directory created in previous steps
    HTML file "overview-features.html" in "cucumber-html-reports" folder is the comprehensive test report of all test scenarios
    
  
  
  

