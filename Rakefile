require 'rubygems'
require 'fileutils'
require 'erb'
require 'tempfile'
require 'securerandom'
require 'json'

task :install do
  metadata = JSON.parse(File.read("/opt/durga/meta.json"))
   
  dbpassword = metadata['dbinfo']['dbpass']

  mysql = `/usr/bin/docker run --name mysql001 -e MYSQL_ROOT_PASSWORD=#{dbpassword} -d mysql`.chomp
  mysql_ip = `/usr/bin/docker  inspect --format '{{ .NetworkSettings.IPAddress }}' #{mysql}`.chomp
  jasper = `/usr/bin/docker run --name jasper001 -e MYSQL_HOST=#{mysql_ip} -e MYSQL_PASSWORD=#{mysql_ip} -P -d platformer/jasperserver-cp:5.6.0`.chomp

end
