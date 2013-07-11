current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ket"
client_key               "#{current_dir}/ket.pem"
validation_client_name   "try-validator"
validation_key           "#{current_dir}/try-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/try"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
