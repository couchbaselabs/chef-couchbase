#
# Cookbook Name:: couchbase
# Recipe:: xdcr
#

Chef::Log.info "Get uuid information of the remote cluster"
s_uuid = `curl 'http://Administrator:password@172.23.105.63:8091/pools' | python -mjson.tool |sed -e 's/[","]/''/g' | awk -F "uuid: " '{print $2}'`
uuid= s_uuid.strip

remote_cluster = search(:node, 'role:east_cluster')
remote_node=remote_cluster[0]["ipaddress"]

xdcr_ref "Create XDCR Replication reference  " do
        uuid uuid
	remote_name "remote_link"
	remote_node remote_node
        username node['couchbase']['server']['username']
        password node['couchbase']['server']['password']
end

xdcr_start "Setting up replication from bucket default to default" do
        uuid uuid
        to_cluster "remote_link"
	from_bucket "default"
	to_bucket "default"
        replication_type "continuous"
        username node['couchbase']['server']['username']
        password node['couchbase']['server']['password']
end

