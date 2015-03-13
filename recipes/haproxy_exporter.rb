prometheus_client_haproxy node.name do
  action      :install
  scrape_uri  "http://#{node.ipaddress}:1944"
end