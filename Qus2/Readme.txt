1. Host the Dockerfile in the root directory 
2. Execute the docker.sh file 
		* It will execute the Prerequest function "verify the Docker was installed or not"
		* If not, then it will automatically install the docker 
		* Then It will install the elasticsearch with the port of 9200
		* Finally we can able to get the json as output with the help for curl function
				

Output:

[root@76f9f034c881 elasticsearch]# curl http://localhost:9200
{
  "name" : "ld7Eyes",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "wIuswhfLSuqvb1-8l1Vj_A",
  "version" : {
    "number" : "6.4.2",
    "build_flavor" : "default",
    "build_type" : "tar",
    "build_hash" : "04711c2",
    "build_date" : "2018-09-26T13:34:09.098244Z",
    "build_snapshot" : false,
    "lucene_version" : "7.4.0",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}
