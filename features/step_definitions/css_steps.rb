#inspired by
#http://stackoverflow.com/questions/14464392/is-it-possible-to-access-a-style-type-css-selector-when-using-cheezys-page-ob
#http://cweiske.de/tagebuch/XPath%3A%20Select%20element%20by%20class.htm
When /^I should see class "([^\"]*)" on element with id "([^\"]*)"$/ do |css_class, id|
	path = "//*[contains(@class, #{css_class}) and @id='#{id}']"
	find(:xpath, path)
end