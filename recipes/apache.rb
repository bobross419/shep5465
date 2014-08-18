# Include the necessary recipes.
%w(rackspace_iptables apt apache2::default).each do |recipe|
  include_recipe recipe
end

site_name = 'de1.sheppyreno.com'
site = node['apache']['sites'][site_name]

add_iptables_rule('INPUT', "-m tcp -p tcp --dport #{site['port']} -j ACCEPT", 100, 'Allow access to apache')

directory "#{site['docroot']}/current" do
  recursive true
  owner node['apache']['user']
  group node['apache']['group']
  action :create
end

web_app site_name do
  port site['port']
  cookbook site['cookbook']
  template site['template']
  server_name site['server_name']
  server_aliases site['server_alias']
  docroot site['docroot']
  allow_override site['allow_override']
  errorlog site['errorlog']
  customlog site['customlog']
  loglevel site['loglevel']
end

template "#{site['docroot']}/current/index.html" do
  source 'maintenance.html.erb'
  variables(
    :name => site_name
  )
  action :create
end

service 'apache2' do
  action :restart
end
