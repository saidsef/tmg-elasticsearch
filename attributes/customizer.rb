# === VERSION
#
override['elasticsearch']['version']       = "1.4.4"
override['elasticsearch']['host']          = "http://download.elasticsearch.org"
override['elasticsearch']['repository']    = "elasticsearch/elasticsearch"
override['elasticsearch']['filename']      = "elasticsearch-#{node.elasticsearch[:version]}.tar.gz"
override['elasticsearch']['download_url']  = [node.elasticsearch[:host], node.elasticsearch[:repository], node.elasticsearch[:filename]].join('/')

override['elasticsearch']['deb_url'] = "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.deb"
override['elasticsearch']['deb_sha'] = "63471c1e9d5f6c5cf2c4d5fe20a9c27c86720810"

override['elasticsearch']['rpm_url'] = "https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.noarch.rpm"
override['elasticsearch']['rpm_sha'] = "ec8b41c54a6d897479645b2507476e0824bc71db"

# === PLUGIN

override['elasticsearch']['plugins']['elasticsearch/elasticsearch-cloud-aws']['version'] = '2.4.1'
