Given /^I am on (.+)$/ do |path|
  visit path
end

When /^I go to (.*)$/ do |path|
  visit path
end

Given /^I have entered "([^"]*)" into the "([^"]*)" field$/ do |text, field|
  fill_in field, :with => text
end

When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  fill_in(field, :with => value) 
end

When /^I select "(.*)" from "(.*)"$/ do |value, field|
  select(value, :from => field) 
end

When /^I check "(.*)"$/ do |field|
  check(field) 
end

When /^I uncheck "(.*)"$/ do |field|
  uncheck(field) 
end

When /^I choose "(.*)"$/ do |field|
  choose(field)
end

Then /^I should see "(.*)"$/ do |text|
  page.body.to_s.should =~ /#{text}/m
end

Then /^I should not see "(.*)"$/ do |text|
  page.body.to_s.should_not =~ /#{text}/m
end

#https://github.com/daneroo/capybara-phantomjs/blob/master/features/step_definitions/web_steps.rb
When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
  stamp = Time.now.strftime("%Y%m%d%H%M%S");
  save_screenshot("screen-#{stamp}.png")
end

When /^I sign in as "(.*?)"$/ do |arg1|
  fill_in("username", :with => arg1.split("/")[0])
  fill_in("password", :with => arg1.split("/")[1])
  click_button('Login')
end

When /^I sign into facebook as "(.*?)"$/ do |arg1|
  fill_in("email", :with => arg1.split("/")[0])
  fill_in("pass", :with => arg1.split("/")[1])
  click_button('Log In')
end

When /^I click the "([^"]*)" link$/ do |link_text|
  click_link link_text
end

When /^I click the "([^"]*)" button$/ do |button_text|
  click_button button_text
end

#https://github.com/mrako/standalone-cucumber/blob/master/features/step_definitions/web_steps.rb

Then /^show me the page$/ do
  save_and_open_page
end

require_relative 'file_steps.rb'