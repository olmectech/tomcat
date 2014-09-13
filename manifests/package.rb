#!/usr/bin/env ruby
#
# This program downloads a package and untars it.
#

require 'yaml'


class Getfile 

class_variable_set(:@@test, 'wget http://mirrors.axint.net/apache/tomcat/tomcat-7/v7.0.42/bin/apache-tomcat-7.0.42.tar.gz')
class_variable_set(:@@file, 'tar -xvf apache-tomcat-7.0.42.tar.gz')
class_variable_set(:@@remove, 'rm -rf apache-tomcat-7.0.42.tar*')
class_variable_set(:@@dir, 'apache-tomcat-7.0.42')

 def download_file
%x[#{@@test}]
  end

def extract_file
%x[#{@@file}]
end

def remove_file
%x[#{@@remove}]
end

if Dir.exists?("#{@@dir}") 
puts "Directory #{@@dir} exists. Exiting program."
else
o = Getfile.new
o.download_file
o.extract_file
o.remove_file
end
end
