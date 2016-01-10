Given(/^they start searching for a todo item$/) do
  fill_in "Search", :with => "Ride"
end

Then(/^I should see all partially matching searches$/) do
  within("#search-results") do
    expect(page.has_content?('Ride an Elephant')).to be true
    expect(page.has_content?('Ride in an aircraft')).to be true
  end
end

When(/^I finish typing out my search$/) do
  fill_in "Search", :with => "Ride an Elephant"
end

Then(/^I should see all matching searches$/) do
  within("#search-results") do
    expect(page.has_content?('Ride an Elephant')).to be true
  end
end

Given(/^they start searching for a todo item that doesn't exist$/) do
  fill_in "Search", :with => "Ride a dragon"
end

Then(/^I should see a caveat saying no results were found$/) do
  expect(page.has_content?('No results found')).to be true
end






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

