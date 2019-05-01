$: << File.dirname(__FILE__)+'/../lib'

ENVIRONMENT = (ENV['ENVIRONMENT'] || 'application').to_sym
Dir.mkdir('report') unless File.directory?('report')
#raise "You need to rename application.yml.example to configuration file named '#{ENVIRONMENT}.yml' under config" unless File.exist? "#{File.dirname(__FILE__)}/../../config/#{ENVIRONMENT}.yml"

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec/core'
require 'rspec/expectations'
require 'faker'
require 'helpers/capybara_helper'
require 'active_support/inflector'
require 'env_config'
require 'pages'


World(CapybaraHelper)

Capybara.configure do |config|

  config.default_driver = :selenium
  config.javascript_driver = :selenium

  config.run_server = EnvConfig.get :run_server
  config.default_selector = EnvConfig.get :default_selector
  config.default_max_wait_time = EnvConfig.get :wait_time
  config.app_host = ENV['app_url'] || (EnvConfig.get :app_url)

  #capybara 2.1 config options
  config.match = EnvConfig.get :match

end


client = Selenium::WebDriver::Remote::Http::Default.new
client.timeout = 15

case ENV['BROWSER']
  when 'firefox'
    Capybara.register_driver :selenium do |app|
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.assume_untrusted_certificate_issuer = true
      caps = Selenium::WebDriver::Remote::Capabilities.firefox(
          {
              marionette: true,
              accept_insecure_certs: true,
              firefox_options: {profile: profile},
          }
      )
      Capybara::Selenium::Driver.new(
          app,
          browser: :firefox,
          desired_capabilities: caps
      )
    end
  when 'chrome'
    Capybara.javascript_driver = :selenium
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :http_client => client, :browser => :chrome)
    end
  Capybara.default_max_wait_time = 15
  Capybara.ignore_hidden_elements = false
end

