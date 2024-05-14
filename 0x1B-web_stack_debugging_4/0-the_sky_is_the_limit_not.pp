# This script enhances the traffic handling capability of an Nginx server

# Increase the ULIMIT of the default file
file { 'fix-for-nginx':
  ensure  => 'file',
  path    => '/etc/default/nginx',
  content => inline_template('<%= File.read("/etc/default/nginx").gsub(/ulimit -n 15/, "ulimit -n 4096") %>'),
}

# Restart Nginx
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  require => File['fix-for-nginx'],
}
