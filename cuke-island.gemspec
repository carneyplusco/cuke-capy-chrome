# -*- encoding: utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + "/lib/cuke_island")

Gem::Specification.new do |s|
  s.name        = 'cuke-island'
  s.version     = CukeIsland::VERSION
  s.date        = '2013-03-22'
  s.summary     = "Standalone webdriver generator"
  s.description = "Standalone generator for a lightly configured cucumber capybara chromedriver test enviroment: cuke-island <test folder>"
  s.authors     = ["Paul Scarrone", "Todd Huss", "Julian Toker"]
  s.email       = 'paul.scarrone@gmail.com'
  s.homepage    = "https://github.com/ninjapanzer/cuke-capy-chrome"
  s.require_paths    = ["lib"]
  s.files = ["bin/cuke-island", "lib/cuke_island.rb", "Gemfile", "Rakefile"] + Dir.glob("features/**/*")
  s.has_rdoc         = true
  s.extra_rdoc_files = ['README.rdoc']
  s.executables      = ["cuke-island"]
  s.add_dependency("thor", "0.17.0")
  s.add_dependency("rake", "10.0.3")
  s.add_dependency("capybara", "2.0.2")
  s.add_dependency("cucumber", "1.2.1")
  s.add_dependency("capybara-webkit", "0.14.2")
  s.add_dependency("rspec", "2.13.0")
  s.add_dependency("poltergeist", "1.1.0")
  s.add_dependency("selenium-webdriver", "2.30.0")
end