1. Host the Dockerfile in the root directory 
2. Execute the docker.sh file 
		* It will execute the Prerequest function "verify the Docker was installed or not"
		* If not, then it will automatically install the docker 
		* Then It will install the elasticsearch with the port of 9200
		* Finally we can able to get the json as output with the help for curl function
				

Output:
				
root@1a12d583b1e2:/# curl http://localhost:9200
{
  "name" : "node-1",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "QSNkheRQSJ-Vfe6NEirGFQ",
  "version" : {
    "number" : "2.4.6",
    "build_hash" : "5376dca9f70f3abef96a77f4bb22720ace8240fd",
    "build_timestamp" : "2017-07-18T12:17:44Z",
    "build_snapshot" : false,
    "lucene_version" : "5.5.4"
  },
  "tagline" : "You Know, for Search"
}
