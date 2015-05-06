use_inline_resources

action :install do
  prometheus_client_exporter "haproxy_exporter" do
    action      :install
    service     new_resource.service
    binary_url  "https://github.com/prometheus/haproxy_exporter/releases/download/#{node.prometheus_client.haproxy_exporter.version}"
    checksums   node.prometheus_client.haproxy_exporter.checksums
    version     node.prometheus_client.haproxy_exporter.version
    arguments   %Q!-haproxy.scrape-uri="#{new_resource.scrape_uri}" -web.listen-address=":#{new_resource.port}"!
  end
end

#----------

action :delete do

end