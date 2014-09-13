class tomcat {

$source = 'http://mirrors.axint.net/apache/tomcat/tomcat-7/v7.0.42/bin/apache-tomcat-7.0.42.tar.gz'
$package = 'apache-tomcat-7.0.42.tar.gz'

package { "java-1.7.0-openjdk-src.x86_64":
    ensure  => present,
  }


exec { 'download-apache-tomcat-7.0.42.tar.gz':
command => "wget $source", 
cwd => "/$id",
path => '/usr/bin/',
creates => '/root/apache-tomcat-7.0.42'
}

exec {'extract-apache-tomcat-7.0.42.tar.gz':
command => "tar -xvf $package",  
cwd => "/$id",
path => '/bin/',
unless => '/bin/ls -l|grep $package ',
require => Exec['download-apache-tomcat-7.0.42.tar.gz'],
   }

exec {'remove package':
command => "rm $package",  
cwd => "/$id",
path => '/bin/',
#onlyif => '/bin/ls -l /$id/apache-tomcat-7.0.42.tar.gz',
#require => Exec['extract-apache-tomcat-7.0.42.tar.gz']
 }
}
