# === VERSION
#
default['elasticsearch']['version']       		= "1.7"
default['elasticsearch']['thread_stack_size'] 	= "512k"
default['elasticsearch']['limits']['hard'] 		= 'unlimited'
default['elasticsearch']['limits']['nofile'] 	= '500000'
default['elasticsearch']['limits']['memlock'] 	= 'unlimited'

default['elasticsearch']['index.number_of_shards'] 		= 3
default['elasticsearch']['index.number_of_replicas'] 	= 1

# === DEFAULT PROPERTIES
#
default['elasticsearch']['user']			= 'elasticsearch'
default['elasticsearch']['group']			= 'elasticsearch'
default['elasticsearch']['skip_restart']	= false
default['elasticsearch']['path.data']		= node['elasticsearch']['path.data'] || ''
default['elasticsearch']['cluster.name'] 	= node['elasticsearch']['cluster.name'] || ''
default['elasticsearch']['node.name']		= node['fqdn']
default['elasticsearch']['node.master']		= true
default['elasticsearch']['node.data']		= true
default['elasticsearch']['node.max_local_storage_nodes'] 	= 1
default['elasticsearch']['index.number_of_shards']		 	= 3
default['elasticsearch']['index.number_of_replicas']		= 1
default['elasticsearch']['action.auto_create_index']		= true
default['elasticsearch']['action.disable_delete_all_indices'] = true
default['elasticsearch']['index.store.type']				= 'mmapfs'
default['elasticsearch']['indices.store.throttle.max_bytes_per_sec'] = '300m'
default['elasticsearch']['indices.store.throttle.type']		= 'none'
default['elasticsearch']['indices.memory.index_buffer_size'] = '30%'
default['elasticsearch']['indices.fielddata.cache.size']	 = '45%'
default['elasticsearch']['refresh_interval']				 = '120s'
default['elasticsearch']['cluster.routing.allocation.node_initial_primaries_recoveries'] = 4
default['elasticsearch']['cluster.routing.allocation.node_concurrent_recoveries'] = 3
default['elasticsearch']['indices.recovery.max_bytes_per_sec'] 	= '100mb'
default['elasticsearch']['indices.recovery.concurrent_streams'] = 3
default['elasticsearch']['bootstrap.mlockall']					= true
default['elasticsearch']['http.port']							= 9200
default['elasticsearch']['gateway.expected_nodes']				= 1
default['elasticsearch']['discovery.type']						= 'ec2'
default['elasticsearch']['discovery.zen.minimum_master_nodes']	= 1
default['elasticsearch']['discovery.zen.ping.multicast.enabled'] = true
default['elasticsearch']['cloud.node.auto_attributes']			= true

# === PLUGIN
#
default['elasticsearch']['plugins']['elasticsearch/elasticsearch-cloud-aws']['version'] = '2.7.1'
default['elasticsearch']['plugins']['elasticsearch/marvel']['version'] = 'latest'

# === MEMORY
#
# Maximum amount of memory to use is automatically computed as 85% of total available memory on the machine.
# You may choose to set it in your node/role configuration instead.
#
allocated_memory = "#{(node.memory.total.to_i * 0.92 ).floor / 1024}m"
default['elasticsearch']['allocated_memory'] = allocated_memory
