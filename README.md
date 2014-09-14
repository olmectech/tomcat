# tomcat

 This module ensures java 1.7 is installed and runs custom function to download tomcat 7.0.42, untar it,
 and then install it. It checks every Puppet run to see if tomcat is still running. If not it will restart.
 All the files you need are located in the manifests directory.
 
 
- package { 'java-1.7.0-openjdk-src.x86_64':
 - ensure  => present,
  -}


- exec { 'download-apache-tomcat-7.0.42.tar.gz':
  - command => '/opt/puppet/bin/ruby /etc/puppetlabs/puppet/modules/tomcat/manifests/package.rb',
  - cwd => '/opt/',
- }

- exec { 'restart-tomcat':
  - command => '/etc/init.d/tomcat start',
  -  }
- }
