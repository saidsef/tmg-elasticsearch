
# request, reqpath, requrl template from string analyzed to string not_analyzed so we can do top urls stats
execute "Adding Escenic Templates" do
	command <<-EOH
		sleep 3
		curl -XPUT localhost:9200/_template/escenic -d '
		{
		    "template" : "escenic*",
		    "mappings" : {
		        "_default_": {
		            "properties" : {
		                "reqpath" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "reqparam" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "request" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                }
		            }
		        }
		    }
		}'
	EOH
end

execute "Adding AEM Templates" do
	command <<-EOH
		sleep 3
		curl -XPUT localhost:9200/_template/aem -d '
		{
		    "template" : "aem*",
		    "mappings" : {
		        "_default_": {
		            "properties" : {
		                "reqpath" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "reqparam" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "request" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                }
		            }
		        }
		    }
		}'
	EOH
end

execute "Adding CoreAPI Templates" do
	command <<-EOH
		sleep 3
		curl -XPUT localhost:9200/_template/coreapi -d '
		{
		    "template" : "coreapi*",
		    "mappings" : {
		        "_default_": {
		            "properties" : {
		                "reqpath" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "reqparam" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "request" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                }
		            }
		        }
		    }
		}'
	EOH
end

execute "Adding Nitro Templates" do
	command <<-EOH
		sleep 3
		curl -XPUT localhost:9200/_template/nitro -d '
		{
		    "template" : "nitro*",
		    "mappings" : {
		        "_default_": {
		            "properties" : {
		                "reqpath" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "reqparam" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "request" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                }
		            }
		        }
		    }
		}'
	EOH
end

execute "Adding Turner Templates" do
	command <<-EOH
		sleep 3
		curl -XPUT localhost:9200/_template/turner -d '
		{
		    "template" : "turner*",
		    "mappings" : {
		        "_default_": {
		            "properties" : {
		                "reqpath" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "reqparam" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "request" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                }
		            }
		        }
		    }
		}'
	EOH
end

execute "Adding Proxy Cache Templates" do
	command <<-EOH
		sleep 3
		curl -XPUT localhost:9200/_template/proxy_cache -d '
		{
		    "template" : "proxy_cache*",
		    "mappings" : {
		        "_default_": {
		            "properties" : {
		                "reqpath" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "reqparam" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                },
		                "request" : {
		                    "type" : "string",
		                    "norms" : {
		                        "enabled" : false
		                    },
		                    "index": "not_analyzed",
		                    "doc_values": true
		                }
		            }
		        }
		    }
		}'
	EOH
end