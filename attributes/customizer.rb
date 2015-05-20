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

override['elasticsearch']['thread_stack_size'] = "512k"

override['elasticsearch']['limits']['hard'] = 'unlimited'
override['elasticsearch']['limits']['nofile'] = '500000'
override['elasticsearch']['limits']['memlock'] = 'unlimited'

# === PLUGIN

override['elasticsearch']['plugins']['elasticsearch/elasticsearch-cloud-aws']['version'] = '2.4.1'
override['elasticsearch']['plugins']['elasticsearch/marvel']['version'] = 'latest'

# === MEMORY
#
# Maximum amount of memory to use is automatically computed as 90% of total available memory on the machine.
# You may choose to set it in your node/role configuration instead.
#
allocated_memory = "#{(node.memory.total.to_i * 0.90 ).floor / 1024}m"
allocated_heap = "#{(node.memory.total.to_i * 0.60 ).floor / 1024}m"
default.elasticsearch[:allocated_memory] = allocated_memory
default.elasticsearch[:allocated_heap] = allocated_heap
