class tomcat {

package { 'java-1.7.0-openjdk-src.x86_64':
    ensure  => present,
  }


exec { 'download-apache-tomcat-7.0.42.tar.gz':
command => '/opt/puppet/bin/ruby /etc/puppetlabs/puppet/modules/tomcat/manifests/package.rb',
cwd => '/opt/',
}

exec { 'restart-tomcat':
command => '/etc/init.d/tomcat start',
}
}

