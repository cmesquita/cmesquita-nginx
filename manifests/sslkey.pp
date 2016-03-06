define cmesquita-nginx::sslkey ( $certdir = 'UNDEF', $servername = 'UNDEF' ) {
	exec {"ssl_key_${servername}":
  		command => "openssl req -newkey rsa:2048 -nodes -keyout ${servername}.key  -x509 -days 365 -out ${servername}.crt -subj '/CN=${servername}'",
  		cwd     => $certdir,
  		creates => [ "${certdir}/${servername}.key", "${certdir}/${servername}.crt", ],
  		path    => ["/usr/bin", "/usr/sbin"]
	}
}
