use_inline_resources

action :install do
  service = new_resource.service || new_resource.name
  binary  = new_resource.binary || new_resource.name

  service service do
    action    :nothing
    supports  [:start,:stop,:restart,:enable,:disable]
  end

  # what file are we fetching?
  version_os_arch = "#{new_resource.version}.#{node.prometheus_client.os}-#{node.prometheus_client.cpu_arch}"
  file = "#{new_resource.exporter||new_resource.name}-#{version_os_arch}.tar.gz"

  if new_resource.checksums
    checksum = new_resource.checksums[version_os_arch]
  end

  tarball_x "#{Chef::Config[:file_cache_path]}/#{file}" do
    destination new_resource.install_dir
    owner "root"
    group "root"
    action :nothing
    notifies  :restart, "service[#{service}]"
  end

  remote_file "#{Chef::Config[:file_cache_path]}/#{file}" do
    source    "#{new_resource.binary_url}/#{file}"
    if checksum
      checksum checksum
    end
    mode      0644
    notifies :extract, "tarball_x[#{Chef::Config[:file_cache_path]}/#{file}]"
  end

  if node['platform'] == 'ubuntu' && node['platform_version'] >= '15.04'
    template "/lib/systemd/system/#{service}.service" do
      action    :create
      source    "exporter.systemd.erb"
      cookbook  "prometheus-client"
      variables({
        resource:   new_resource,
        service:    service,
        binary:     binary,
      })
      notifies :enable, "service[#{service}]"
      notifies :start,  "service[#{service}]"
    end
  else
    template "/etc/init/#{service}.conf" do
      action    :create
      source    "exporter.upstart.erb"
      cookbook  "prometheus-client"
      variables({
        resource:   new_resource,
        service:    service,
        binary:     binary,
      })
      notifies :enable, "service[#{service}]"
      notifies :start,  "service[#{service}]"
    end
  end

end

#----------

action :delete do

end
