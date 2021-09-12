function fn() {
  	
  	var config = {
   		api_url: 'https://13.57.91.206/CMDB/v1/data/cmdb'
  	}
  
	karate.configure('ssl', true);
  	karate.configure('headers', {'Content-Type': 'application/json', Accept: 'application/json', Authorization: 'Bearer cwcjPCxJbJwGoEFNoCJr'});
  	return config;
	
}
