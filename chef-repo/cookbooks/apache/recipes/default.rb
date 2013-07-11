#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd2" do
	case node[:platform]
	when "centos","redhat"
		package_name "httpd"
	end
	action :install
end

service "httpd" do
	action [:start, :enable]
end

cookbook_file "/var/www/index.html" do
	source "index.html"
	mode "0644"
end
