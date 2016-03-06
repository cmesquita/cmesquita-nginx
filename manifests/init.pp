class cmesquita-nginx {

	class { 'nginx': }
	
	cmesquita-nginx::sslkey { "www.wimdu.com_key":
		certdir => '/www.wimdu.com',
		servername => 'www.wimdu.com',
	}

	cmesquita-nginx::sslkey { "www.wimdu.de_key":
		certdir => '/www.wimdu.de',
		servername => 'www.wimdu.de',
	}

	cmesquita-nginx::sslkey { "www.wimdu.it_key":
		certdir => '/www.wimdu.it',
		servername => 'www.wimdu.it',
	}
	
	cmesquita-nginx::vhost { "www.wimdu.com":
		servername => "www.wimdu.com",
		docroot => "/www.wimdu.com/",
		certdir => "/certkeys/www.wimdu.com",
		certname => "www.wimdu.com", 
	}

	cmesquita-nginx::vhost { "www.wimdu.de":
		servername => "www.wimdu.de",
		docroot => "/www.wimdu.de/",
		certdir => "/certkeys/www.wimdu.de",
		certname => "www.wimdu.de", 
	}

	cmesquita-nginx::vhost { "www.wimdu.it":
		servername => "www.wimdu.it",
		docroot => "/www.wimdu.it/",
		certdir => "/certkeys/www.wimdu.it",
		certname => "www.wimdu.it", 
	}

}
