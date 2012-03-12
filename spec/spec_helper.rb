require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :test)

require 'capybara/rspec'

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each {|f| require f}

Capybara.run_server = false
Capybara.app_host = "http://localhost:#{ENV_YAML['PORT']}"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  def json
    current_html = body
    current_html =~ /<pre.*?>(.*)<\/pre>/
    JSON.parse($1)
  end
end
