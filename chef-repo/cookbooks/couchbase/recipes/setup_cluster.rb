#
# Cookbook Name:: couchbase
# Recipe:: setup_cluster
#

#cluster_name = node["cluster_name"]
cluster_name = east_cluster
prefix = "ns_1@"
separator=","
known_nodes=prefix+self.node["ipaddress"]

cluster = search(:node, "role:#{cluster_name}")
cluster.each do |node|
	if node["ipaddress"] != self.node["ipaddress"]
		log " Adding new nodes"
		known_nodes=known_nodes+separator+prefix+"#{node["ipaddress"]}"
		add_node "#{cluster_name}" do
  			hostname node["ipaddress"]
  			username node['couchbase']['server']['username']
  			password node['couchbase']['server']['password']
		end
	end
end

ejected_nodes = ""
cluster_rebal "Rebalance-In Nodes to form a cluster  " do
        ejectedNodes ejected_nodes
	knownNodes known_nodes
        username node['couchbase']['server']['username']
        password node['couchbase']['server']['password']
end

couchbase_bucket "default" do
  memory_quota_mb 100

  username node['couchbase']['server']['username']
  password node['couchbase']['server']['password']
end

