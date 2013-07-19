.ssh/config builder
==================
Creates a .ssh/config file from the ec2 instances tags.

Usage
-----
Assumptions
  your have ruby, bundler installed

First run:  bundle install

Add right config to config.yml or the defaul values will be picked from AWS_ACCESS_KEY and AWS_SECRET_KEY environment variables. You can specify path to ssh_config_file inside config.yml else output will be thrown to your screen which you can then redirect to any file.

Example Usage
./ssh_config_builder.rb >> ~/.ssh/config

Example
-------
Say you have 2 app_servers, 3 background_servers and 2 db instances in AWS.
This ruby script generates a .ssh/config file in the following format

#sample .ssh/config file

    Host app_server
      Hostname ec2****.com
      User ubuntu

    Host app_server1
      Hostname ec2****.com
      User ubuntu

    Host background_server
      Hostname ec2****.com
      User ubuntu

    Host background_server2
      Hostname ec2****.com
      User ubuntu

    Host db1
      Hostname ec2****.com
      User ubuntu

This .ssh/config can be kept up-to-date by running this ruby script frequently.

Installing autocomplete script
------------------------------
This commands adds few lines of bash code to ~/.bashrc or ~/.bash_profile, which autocompletes HOST names
./install_autocomplete.rb

ssh App[press TAB]  
AppServer AppServer1 AppServer2
