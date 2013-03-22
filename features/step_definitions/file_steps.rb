Then /^I should get a download with the filename "([^\"]*)"$/ do |filename|
  download_name.should include filename
end

When /^I upload a downloaded file to "([^\"]*)"$/ do |field|
	#downloads.include? filename
	attach_file(field, downloads.first)
end

Then /^I should clear downloads$/ do
	clear_downloads
end