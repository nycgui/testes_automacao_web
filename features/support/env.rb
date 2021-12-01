require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'faker'
require 'pry'

require_relative 'page_objects'

World(PageObjects)

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://automacaocombatista.herokuapp.com'
  config.default_max_wait_time = 10
end