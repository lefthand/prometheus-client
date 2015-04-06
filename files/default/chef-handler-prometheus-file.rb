require 'rubygems'
require 'chef'
require 'chef/handler'
require 'erb'
require 'fileutils'

TEMPLATE = <<-eos
# HELP chef_client_successful Was the latest Chef Client run successful?
# TYPE chef_client_successful gauge
chef_client_successful{node="<%= node.name %>"} <%= success? ? 1 : 0 %>
# HELP chef_client_runtime_seconds Seconds taken by the most recent Chef client run
# TYPE chef_client_runtime_seconds gauge
chef_client_runtime_seconds{node="<%= node.name %>"} <%= end_time - start_time %>
# HELP chef_client_resources_updated Number of resources updated in the most recent Chef client run
# TYPE chef_client_resources_updated gauge
chef_client_resources_updated{node="<%= node.name %>"} <%= updated_resources.length %>
eos

class PrometheusHandler < Chef::Handler
  attr_reader :output_file

  def initialize(options = {})
    @output_file = File.join(options[:file_path],"chef_client.prom")

    @template = ERB.new TEMPLATE
  end

  def report
    File.open("#{@output_file}.$$","w") do |f|
      f << @template.result(run_status.instance_eval { binding() })
      f.flush()
    end

    FileUtils.mv("#{@output_file}.$$",@output_file)
  end

end