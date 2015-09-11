

execute "Creating Infra Snapshot Entry" do
	command <<-EHO
		sleep 2
		curl -XPOST http://localhost:9200/_snapshot/s3_infra_snapshot -d '
		{
		  "type": "s3",
		  "settings": {
		    "bucket": "telegraph-elasticsearch-snapshots",
		    "base_path" : "infra",
		    "max_snapshot_bytes_per_sec": "500mb",
		    "region": "eu-west-1"
		  }
		}'
	EHO
end

hour=Random.rand(3...5)

cron "daily_snapshot" do
	minute "0"
	hour "#{hour}"
	command "curl -s -XPUT http://localhost:9200/_snapshot/s3_infra_snapshot/snapshot_$(date -d +'%Y%m%d')?wait_for_completion=false"
end