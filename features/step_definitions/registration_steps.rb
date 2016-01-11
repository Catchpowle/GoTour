Given(/^a user is on the home page$/) do
  visit root_path
end

When(/^a user clicks to register as a fan$/) do
  click_on('Fan')
end

When(/^the user fills in the form with valid fan registration information$/) do
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

  fill_in 'Email', with: 'jon@email.com'
  fill_in 'Name', with: 'Jon Catchpowle'
  fill_in 'City', with: 'London'
  fill_in 'Country', with: 'UK'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
end

When(/^the user clicks sign up$/) do
  click_on('Sign up')
end

Then(/^a fan should be created$/) do
  expect(Fan.all.length).to eq(1)
  expect(Fan.first.email).to eq('jon@email.com')
  expect(Fan.first.name).to eq('Jon Catchpowle')
  expect(Fan.first.city).to eq('London')
  expect(Fan.first.country).to eq('UK')
end

Then(/^I'm taken to the homepage$/) do
  expect(current_path).to eq(root_path)
end

When(/^a user clicks to register as an artist$/) do
  click_on('Artist')
end

When(/^the user fills in the form with valid artist registration information$/) do
  fill_in 'Email', with: 'artist@email.com'
  fill_in 'Name', with: 'Band'
  fill_in 'Bio', with: 'Music playing folk'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
end

Then(/^an artist should be created$/) do
  expect(Artist.all.length).to eq(1)
  expect(Artist.first.email).to eq('artist@email.com')
  expect(Artist.first.name).to eq('Band')
  expect(Artist.first.bio).to eq('Music playing folk')
end
