Given(/^artists exist$/) do
  Artist.create!(email: 'radiohead@email.com', name: 'Radiohead', bio: 'Folk ok with computers', password: 'password', password_confirmation: 'password')
  Artist.create!(email: 'thestoneroses@email.com', name: 'The Stone Roses', bio: 'Folk banging drums', password: 'password', password_confirmation: 'password')
  Artist.create!(email: 'therollingstones@email.com', name: 'The Rolling Stones', bio: 'Folk in need', password: 'password', password_confirmation: 'password')
end

When(/^the fan starts searching for an artist$/) do
  fill_in "Search", :with => "Stone"
end

Then(/^the fan should see all partially matching searches$/) do
  expect(page.has_content?('The Stone Roses')).to be true
  expect(page.has_content?('The Rolling Stones')).to be true
end

When(/^the fan finishes typing out their search$/) do
  fill_in "Search", :with => "The Stone Roses"
end

Then(/^the fan should see all matching searches$/) do
  expect(page.has_content?('The Stone Roses')).to be true
end

Given(/^the fan starts searching for an artist item that isn't there$/) do
  fill_in "Search", :with => "The Pixies"
end

Then(/^the fan should see a caveat saying no results were found$/) do
  expect(page.has_content?('No results found')).to be true
end

