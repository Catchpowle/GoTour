Given(/^an artist exists$/) do
  Artist.create!(email: 'thestrokes@email.com', name: 'The Strokes', bio: 'Folk from last night', password: 'password', password_confirmation: 'password')
end

Given(/^the fan is on the artists page$/) do
  visit artist_path(Artist.first)
end

When(/^the fan requests the artist$/) do
  click_on 'Request'
end

Then(/^the fan should have an artist$/) do
  sleep 0.1
  expect(Fan.first.artists.length).to eq(1)
end

Then(/^the page should display a Cancel Request button$/) do
  expect(page).to have_content("Cancel Request")
end

Given(/^the fan has requested the artist$/) do
  Fan.first.artists << Artist.first
end

When(/^the fan cancels the request for the artist$/) do
  click_on 'Cancel Request'
end

Then(/^the fan should no longer have an artist$/) do
  sleep 0.1
  expect(Fan.first.artists.length).to eq(0)
end

Then(/^the page should display a Request button$/) do
  expect(page).to have_content("Request")
end
