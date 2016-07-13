unless ENV.include?("knife_chef_server")
    raise "Set chef_server environment variable"
end

knife_node_name = ENV["knife_node_name"] || ENV["USER"]

log_level                :info
log_location             STDOUT
node_name                knife_node_name
client_key               "#{ENV["HOME"]}/.chef/knife.pem"
ssl_verify_mode          :verify_none
chef_server_url          "https://#{ENV["knife_chef_server"]}"
syntax_check_cache_path  '#{ENV["HOME"]}/.chef/syntax_check_cache'
cookbook_path            [
    "#{ENV["HOME"]}/work/my-cookbooks",
]

knife[:vault_mode]   = 'client'
knife[:vault_admins] = [
    knife_node_name,
                       ]
