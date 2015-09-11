
execute "Update Bulk Queue Size" do
	command <<-EOH
	  sleep 4
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
