Given(/^the fan has requested several artists$/) do
  Fan.first.artists << Artist.first
  Fan.first.artists << Artist.third
end

When(/^a fan visits their profile$/) do
  visit fan_path(Fan.first)
end

Then(/^a fan should see their information$/) do
  expect(page).to have_content('Jon Catchpowle')
end

Then(/^the fan should see a list of the artists they have requested$/) do
  expect(page).to have_content('Radiohead')
  expect(page).to have_content('The Rolling Stones')
end

Given(/^an artist is registered$/) do
  Artist.create!(email: 'artist@email.com', name: 'Band', bio: 'Music playing folk', password: 'password', password_confirmation: 'password')
end

Given(/^the artist is signed in$/) do
  visit new_artist_session_path
  fill_in 'Email', with: 'artist@email.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

When(/^an artist visits their profile$/) do
  visit artist_path(Artist.first)
end

Then(/^an artist should see their information$/) do
  expect(page).to have_content('Band')
  expect(page).to have_content('Music playing folk')
end