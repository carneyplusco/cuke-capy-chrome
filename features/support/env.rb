begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara' 
require 'capybara/dsl' 
require 'capybara/cucumber'


Capybara.app_host = 'http://www.google.com'


#Use Webkit
require 'capybara-webkit'
Capybara.default_driver = :webkit

#User Poltergeist - Is Headless and runs without a framebuffer - https://github.com/jonleighton/poltergeist
#require 'capybara/poltergeist'
#Capybara.default_driver = :poltergeist

#Use ChromeDriver
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.javascript_driver = :chrome



World(Capybara) 
