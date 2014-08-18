node.default['apache']['listen_addresses']              = ["#{node['ipaddress']}"]

site = 'de1.sheppyreno.com'

node.default['apache']['sites'][site]['port']           = 80
node.default['apache']['sites'][site]['cookbook']       = 'shep5465'
node.default['apache']['sites'][site]['template']       = "apache2/sites/#{site}.erb"
node.default['apache']['sites'][site]['server_name']    = site
node.default['apache']['sites'][site]['docroot']        = "#{node['apache']['docroot_dir']}/#{site}"
node.default['apache']['sites'][site]['allow_override'] = ['All']
node.default['apache']['sites'][site]['errorlog']       = "#{node['apache']['log_dir']}/#{site}-error.log"
node.default['apache']['sites'][site]['customlog']      = "#{node['apache']['log_dir']}/#{site}-access.log combined"
node.default['apache']['sites'][site]['loglevel']       = 'warn'
node.default['apache']['sites'][site]['server_admin']   = 'sheppy.reno@rackspace.com'
node.default['apache']['sites'][site]['owner']          = 'Sheppy Reno'
# node.default['apache']['sites'][site]['revision']     = "v#{version1}"
# node.default['apache']['sites'][site]['repository'] = 'https://github.com/rackops/php-test-app'
# node.default['apache']['sites'][site]['deploy_key']   = '/root/.ssh/id_rsa'
