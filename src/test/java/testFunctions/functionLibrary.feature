# author: Suresh Singapuram

@ignore
Feature: THIS FEATURE IS A COLLECTION OF HELPER FUNCTIONS FOR API /v1/data/cmdb POST REQUEST

Scenario: FUNCTION LIBRARY

#########################################################################################################################
# 
#########################################################################################################################

* def getRequestBody = 
	"""
		function(payLoad, data) {
			
			karate.log('Entered getRequestBody function');
			
			karate.set('payLoad', '$.collectionName', data.collectionName);
			karate.set('payLoad', '$.outputFields', data.outputFields);
			karate.set('payLoad', '$.filter[0].field', data.field);
			karate.set('payLoad', '$.filter[0].operator', data.operator);
			karate.set('payLoad', '$.filter[0].value', data.value);
			karate.set('payLoad', '$.page.currentPage', data.currentPage);
			karate.set('payLoad', '$.page.itemPerPage', data.itemPerPage);
			
			karate.log('Dynamic Payload :: ', payLoad);
			
			return payLoad;
			
		}
	"""
#########################################################################################################################	
