ENV_YAML = YAML.load_file(File.join(File.dirname(__FILE__), "env.yml"))
APP_DIR = File.dirname(__FILE__)
APP_CFG = File.join(APP_DIR, "..", "..", ".env_nginx.conf")

conf_file = File.read(File.join(APP_DIR, "..", "..", "nginx.conf"))
conf_file.gsub!(/\$ENV_(\w+)/) do
  ENV_YAML[$1]
end
File.open(APP_CFG, "w") do |file|
  file.puts conf_file
end

BIN_DIR = '/usr/local/openresty'

RSpec.configure do |config|
  config.before(:all) do
    `#{BIN_DIR}/nginx/sbin/nginx -c #{APP_CFG} -g "daemon on;"`
  end

  config.after(:all) do
    `rm #{APP_CFG}`
    `kill $(ps ax | awk '/nginx: master/ {print $1}')`
  end
end
