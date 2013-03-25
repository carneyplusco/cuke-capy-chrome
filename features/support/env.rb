begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara' 
require 'capybara/dsl' 
require 'capybara/cucumber'
require "selenium/webdriver"

module DownloadHelpers
  TIMEOUT = 120
  #Put downloads at the same 
  PATH    = File.expand_path (File.dirname(__FILE__)) + "/../../downloads"

  extend self

  def downloads
    Dir[PATH + "/**"]
  end

  def download
    downloads.first
  end

  def download_name
  	wait_for_download
  	File.basename(download)
  end

  def download_content
    wait_for_download
    File.read(download)
  end

  def wait_for_download
    Timeout.timeout(TIMEOUT) do
      sleep 0.1 until downloaded?
    end
    puts downloads
  end

  def downloaded?
    !downloading? && downloads.any?
  end

  def downloading?
    downloads.grep(/\.crdownload$/).any?
  end

  def clear_downloads
    FileUtils.rm_f(downloads)
  end
end

Capybara.app_host = 'http://www.google.com'


#Use Webkit
require 'capybara-webkit'
Capybara.default_driver = :webkit

#User Poltergeist - Is Headless and runs without a framebuffer - https://github.com/jonleighton/poltergeist
#require 'capybara/poltergeist'
#Capybara.default_driver = :poltergeist

#Use ChromeDriver
Capybara.register_driver :chrome do |app|
  profile = Selenium::WebDriver::Chrome::Profile.new
  profile["download.default_directory"] = DownloadHelpers::PATH.to_s
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile => profile)
end
Capybara.javascript_driver = :chrome

World(Capybara)
World(DownloadHelpers)

at_exit do
  DownloadHelpers.clear_downloads
end

AfterStep('@pause') do
  print "Press Return to continue"
  STDIN.getc
end