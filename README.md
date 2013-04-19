.ssh/config builder
==================
Creates a .ssh/config file from the ec2 instances tags.

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

Usage
-----
EC2Helpers.new(ec2_access_key, ec2_secret_key, config_file_path).build_config_file

TODO
----
1.  Read aws keys from config file
2.  Check if $AWS_ACCESS_KEY and $AWS_SECRET_KEY exists and use them
3.  Create a deamon or cron job out of this script so that the .ssh/config is up-to-date
