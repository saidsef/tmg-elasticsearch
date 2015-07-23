# === VERSION
#
override['elasticsearch']['version']       = "1.7.0"
override['elasticsearch']['host']          = "http://download.elasticsearch.org"
override['elasticsearch']['repository']    = "elasticsearch/elasticsearch"
override['elasticsearch']['filename']      = "elasticsearch-#{node.elasticsearch[:version]}.tar.gz"
override['elasticsearch']['download_url']  = [node.elasticsearch[:host], node.elasticsearch[:repository], node.elasticsearch[:filename]].join('/')

override['elasticsearch']['deb_url'] = "https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.0.deb"
override['elasticsearch']['deb_sha'] = "e926fd0818fc5f9a71db383009a981e19f82f587"

override['elasticsearch']['rpm_url'] = "https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.0.noarch.rpm"
override['elasticsearch']['rpm_sha'] = "ff5dafdc7777df4db60bc52bba8c8b7464379b99"

override['elasticsearch']['thread_stack_size'] = "512k"

override['elasticsearch']['limits']['hard'] = 'unlimited'
override['elasticsearch']['limits']['nofile'] = '500000'
override['elasticsearch']['limits']['memlock'] = 'unlimited'

override['elasticsearch']['index.number_of_shards'] = 3
override['elasticsearch']['index.number_of_replicas'] = 1

# === PLUGIN

override['elasticsearch']['plugins']['elasticsearch/elasticsearch-cloud-aws']['version'] = '2.4.1'
override['elasticsearch']['plugins']['elasticsearch/marvel']['version'] = 'latest'
#override['elasticsearch']['plugins']['elasticsearch/shield']['version'] = 'latest'
#override['elasticsearch']['plugins']['elasticsearch/license']['version'] = 'latest'

# === MEMORY
#
# Maximum amount of memory to use is automatically computed as 90% of total available memory on the machine.
# You may choose to set it in your node/role configuration instead.
#
allocated_memory = "#{(node.memory.total.to_i * 0.90 ).floor / 1024}m"
allocated_heap = "#{(node.memory.total.to_i * 0.55 ).floor / 1024}m"
default.elasticsearch[:allocated_memory] = allocated_memory
default.elasticsearch[:allocated_heap] = allocated_heap
