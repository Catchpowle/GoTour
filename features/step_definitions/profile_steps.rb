Given(/^fans exist$/) do
  Geocoder::Lookup::Test.add_stub(
    "London, UK", [
      {
        'latitude'     => 51.5073509,
        'longitude'    => -0.1277583,
        'address'      => 'London, UK',
        'state'        => 'London',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )

  Geocoder::Lookup::Test.add_stub(
    "Birmingham, UK", [
      {
        'latitude'     => 52.48624299999999,
        'longitude'    => -1.890401,
        'address'      => 'Birmingham, UK',
        'state'        => 'Birmingham',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )

  Fan.create!(email: 'steph@email.com', name: 'Steph Jones', password: 'password', password_confirmation: 'password', city: "London", country: "UK")
  Fan.create!(email: 'jack@email.com', name: 'Jack Jameson', password: 'password', password_confirmation: 'password', city: "Birmingham", country: "UK")
  Fan.create!(email: 'ellie@email.com', name: 'Ellie Smith', password: 'password', password_confirmation: 'password', city: "London", country: "UK")
end

Given(/^the fan has requested several artists$/) do
  Fan.first.artists << Artist.first
  Fan.first.artists << Artist.third
end

Given(/^fans have requested artists$/) do
  Fan.second.artists << Artist.first
  Fan.third.artists << Artist.second
  Fan.fourth.artists << Artist.second
end

When(/^a fan visits their profile$/) do
  visit fan_path(Fan.first)
end

Then(/^a fan should see their information$/) do
  expect(page).to have_content('Jon Catchpowle')
end

Then(/^the fan should see a list of artists they have requested$/) do
  expect(page).to have_content('Radiohead')
  expect(page).to have_content('The Rolling Stones')
end

Then(/^the fan should see a list of artsits they haven't requested but other have in their city$/) do
  expect(page).to have_content('The Stone Roses')
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