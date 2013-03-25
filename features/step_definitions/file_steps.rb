Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
  download_name.should include filename
end

When /^I upload a downloaded file to "([^\"]*)"$/ do |field|
	#downloads.include? filename
	attach_file(field, downloads.first)
end

When /^I upload a file at location "([^\"]*)" to "([^\"]*)"$/ do |location, field|
	attach_file(field, location)
end

When /^I upload a file relative to features at "([^\"]*)" to "([^\"]*)"$/ do |rel_location, field|
	attach_file(field, features(rel_location).first)
end

Then /^I should clear downloads$/ do
	clear_downloads
end