.ssh/config builder
==================
Creates a .ssh/config file from the ec2 instances tags.

Usage
-----
EC2Helpers.new(ec2_access_key, ec2_secret_key, config_file_path).build_config_file  
EC2Helpers.new(ec2_access_key, ec2_secret_key, "~/.ssh/config").build_config_file

Example
-------
Say you have 2 app_servers, 3 background_servers and 2 db instances in AWS.
This ruby script generates a .ssh/config file in the following format

#sample .ssh/config file 

    Host app_server1  
      Hostname ec2****.com   
      User ubuntu  

    Host app_server1  
      Hostname ec2****.com  
      User ubuntu  
    
    Host background_server1  
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
this commands adds few lines of bash code to ~/.bashrc or ~/.bash_profile which autocompletes HOST names
./install_autocomplete.rb           

ssh App[press TAB]  
AppServer AppServer1 AppServer2   

TODO
----
1.  Create a deamon or cron job out of this script so that the .ssh/config is up-to-date
