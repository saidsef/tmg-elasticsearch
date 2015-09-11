
wait_between_attempts = 30
curl_validation_command = "-s --head -XGET localhost:9200/_cluster/health | grep 200"
max_attempts = 30
execute "Waiting for ElasticSearch Node to Start -- please wait..." do
	command <<-EOH
		sleep 15
		ATTEMP=0
	  	while ! #{curl_validation_command} ; do
	  		ATTEMPTS=$(expr ${ATTEMPTS} + 1)
	  		echo "Waiting for ElasticSearch Node to Start -- please wait..."
	  		sleep #{wait_between_attempts}

	        if [ ${ATTEMPTS} -gt #{max_attempts} ] ; then
	          echo "Max attempts reached... exiting with failure status."
	          exit 100
	        fi
	  	done
	EOH
end

execute "Update Bulk Queue Size" do
	command <<-EOH
	  sleep 3
	  curl -XPUT localhost:9200/_cluster/settings -d '
		{
		    "persistent" : {
		        "threadpool.bulk.queue_size" : "500",
		        "indices.store.throttle.max_bytes_per_sec" : "300mb"
		    },
		    "transient" : {
		        "indices.store.throttle.type" : "none",
		        "cluster.routing.allocation.disk.watermark.low" : "97%",
		        "cluster.routing.allocation.disk.watermark.high" : "99%",
		        "cluster.info.update.interval" : "1m",
		        "cluster.routing.allocation.disk.include_relocations": true,
		        "cluster.routing.allocation.cluster_concurrent_rebalance": 3
		    }
		}'
	EOH
end
