define cmesquita-nginx::vhost ( $nginx_path = '/etc/nginx/conf.d' , $servername = 'UNDEF', $docroot = 'UNDEF' , $certdir = 'UNDEF' , $certname = 'UNDEF' ) {
	

	if ! defined(File["$nginx_path"]) {
  		file { "${nginx_path}":
    			ensure => 'directory',
  		}
	} 
	file { "${nginx_path}/${servername}.conf":
		ensure => present,
		notify  => Service['nginx'],
		mode => 755,
		owner => 'root',
		content => template('cmesquita-nginx/sample.nginx.conf.erb'),
		require => File[$nginx_path],
	}
}
