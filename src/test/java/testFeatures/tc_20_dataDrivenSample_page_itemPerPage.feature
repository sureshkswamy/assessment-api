# author: Suresh Singapuram


Feature: TEST - VALIDATE API /v1/data/cmdb (POST) - DATADRIVEN EXAMPLE FOR ITEMPERPAGE VALUES


Background:
* url api_url


Scenario Outline: SUBMIT POST REQUEST - DATADRIVEN ITEMPERPAGE VALUES

# fetch payload template
* def payLoad = read('classpath:testResources/v1_data_cmdb.json')
* print 'Payload template :: ', payLoad
			
# initialize function library
* def testFunctions = call read('classpath:testFunctions/functionLibrary.feature')

# format test data to json
* def testData = {collectionName: <collectionName>, outputFields: <outputFields>, field: <field>, operator: <operator>, value: <value>, currentPage: <currentPage>, itemPerPage: <itemPerPage>}

# function call to create dynamic payload
* def requestBody = testFunctions.getRequestBody(payLoad, testData)

# execute post request
Given request requestBody
When method post
Then assert responseStatus > 0

# parameterized assertions from examples validating against response
* match responseStatus == 500
* match response.message == '<message>'
* match response.errorCode == <errorCode>

Examples:
|	collectionName		|	outputFields				|	field		|	operator	|	value	|	currentPage	|	itemPerPage	| 	message					| errorCode	|
|	AWS_CMDB_Output		|	[CPU_Cores,sourcetype]		|	CPU_Cores	|		=		|	4		|		1		|	3R4rr		|	Invalid data field		|	400005	|
|	AWS_CMDB_Output		|	[CPU_Cores,sourcetype]		|	CPU_Cores	|		=		|	4		|		1		|	-1			|	Invalid item per page	|	400007	|