When /^I upload a file with valid data for 3 new products$/ do
  attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload-files', 'products_csv_ok.csv'))
  click_button "Send file"
end
 
When /^I upload a malformed file$/ do
  attach_file(:csv_file, File.join(RAILS_ROOT, 'features', 'upload-files', 'products_csv_bad.csv'))
  click_button "Send file"
end