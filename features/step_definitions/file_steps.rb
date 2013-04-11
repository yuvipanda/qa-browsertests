Given(/^I am at file that does not exist$/) do
  visit(FileDoesNotExistPage, using_params: {page_name: @does_not_exist_page_name})
end

