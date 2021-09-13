# author: Suresh Singapuram


Feature: TEST - VALIDATE API /v1/data/cmdb (POST) WITH INVALID ITEMPERPAGE VALUE


Background:
* url api_url


Scenario: SUBMIT POST REQUEST WITH INVALID ITEMPERPAGE VALUE

# test data to parameterize request payload
* set testData
| path 					| value 								|
| collectionName 		| 'AWS_CMDB_Output'	 					|
| outputFields			| [CPU_Cores,sourcetype] 				|
| field					| 'CPU_Cores'				 			|
| operator				| '='									|
| value					| 4										|
| currentPage			| 1										|
| itemPerPage			| 's@#$d'								|

# fetch payload template
* def payLoad = read('classpath:testResources/v1_data_cmdb.json')
* print 'Payload template :: ', payLoad
			
# initialize function library
* def testFunctions = call read('classpath:testFunctions/functionLibrary.feature')

# function call to create dynamic payload
* def requestBody = testFunctions.getRequestBody(payLoad, testData)

# execute post request
Given request requestBody
When method post
Then assert responseStatus > 0

# assertions
* match responseStatus == 500
* match response.message == 'Invalid data field'
* match response.errorCode == 400005