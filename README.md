# cmesquita-nginx
## Prereqs
cmesquita-nginx depends on a prior nginx module installation. 
please follow the following instructions to proceed with nginx installation. 

https://forge.puppetlabs.com/jfryman/nginx

Once module jfryman-nginx is installed, a few number of changes must be done in the template files to allow a custom log format and enable custom services.

example: 
  /etc/puppet/modules/nginx/templates/conf.d

file replaced to set up unicorn and custom access log format: nginx.conf.erb

1) 
upstream unicorn {
 server unix:/tmp/.unicorn.sock fail_timeout=0;
}

2)
log_format   wimdu '$remote_addr - $remote_user [$time_local]  $status ' log_format   main '$remote_addr - $remote_user [$time_local]  $status ' '"$http_user_agent" "$http_x_forwarded_for" ';

## SSL Keys configuration 
cmesquita-nginx::sslkey { "www.example.com_key":
    certdir => '/www.example.com',
    servername => 'www.example.com',
}

## Virtual Host Setup 
cmesquita-nginx::vhost { "www.example.com":
    servername => "www.example.com",
    docroot => "/www.example.com/",
   certdir => "/certkeys/www.example.com",
   certname => "www.example.com",
}

