require "AWS"

class EC2Helpers
  def initialize(key, secret, config_file)
    @access_key = key
    @secret_key = secret
    @config_file = File.open(config_file, "a")
    @hostnames = {}
  end

  def construct_config_entry(host, hostname, user = "ubuntu")
    "Host #{host}\n  Hostname #{hostname}\n  User #{user}\n\n"
  end

  def build_config_file
    get_all_servers
    @all_servers.each {|i| create_a_config_entry_for(i)}
  end

  def construct_host_from(ec2_tag)
    host = ec2_tag.split(",").first.gsub(/ |-/, "_").gsub(/\[|\]/,"").gsub(/Spaghetti/, "").gsub(/_+|_$/,"")
    @hostnames[host] = @hostnames[host] ? (@hostnames[host] + 1) : 0
    @hostnames[host] > 0 ? (host + @hostnames[host].to_s) : host
  end

  def create_a_config_entry_for(instance)
    ec2_tag = construct_host_from(@tag_names[instance])
    @config_file.puts(construct_config_entry(ec2_tag, instance))
  end

  def get_all_servers
    @all_servers ||= ec2
  end

  def ec2(filter = "")
    @ec2 ||= AWS::EC2::Base.new(:access_key_id => @access_key , :secret_access_key => @secret_key )
    all_instances = []
    @tag_names = {}
    all_instance_sets.each do |instance_set|
      instances(instance_set).each do |instance|
        all_instances << ec2_name(instance)
        @tag_names[ec2_name(instance)] = tag_name_of(instance)
      end
    end
    all_instances.compact
  end

  def tag_name_of(instance)
    instance["tagSet"] ? instance["tagSet"]["item"].first["value"] : "spot"
  end

  def all_instance_sets
    @all_instance_sets ||=  @ec2.describe_instances['reservationSet']['item']
    @all_instance_sets
  end

  def instances(instance_set)
    instance_set['instancesSet']['item']
  end

  def ec2_name(instance)
    instance['dnsName']
  end
end
