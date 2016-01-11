Given(/^a fan is registered$/) do
  Fan.create!(email: 'jon@email.com', name: 'Jon Catchpowle', password: 'password', password_confirmation: 'password')
end

Given(/^the fan is signed in$/) do
  visit new_fan_session_path
  fill_in 'Email', with: 'jon@email.com'
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end

Given(/^the fan is on it's edit page$/) do
  visit edit_fan_registration_path
end

When(/^the fan enters valid details into the edit form$/) do
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
  
  fill_in 'Name', with: 'Jonathan Catchpowle'
  fill_in 'City', with: 'London'
  fill_in 'Country', with: 'UK'
  fill_in :fan_current_password, with: 'password'
end

When(/^they click update$/) do
  click_on 'Update'
end

Then(/^a fan should be updated$/) do
  expect(Fan.first.name).to eq('Jonathan Catchpowle')
  expect(Fan.first.city).to eq('London')
  expect(Fan.first.country).to eq('UK')
end

Given(/^the artist is on it's edit page$/) do
  visit edit_artist_registration_path
end

When(/^the artist enters valid details into the edit form$/) do
  save_and_open_page
  fill_in 'Name', with: 'The Band'
  fill_in 'Bio', with: 'Sweet music playing folk'
  fill_in :artist_current_password, with: 'password'
end

Then(/^an artist should be updated$/) do
  expect(Artist.first.name).to eq('The Band')
  expect(Artist.first.bio).to eq('Sweet music playing folk')
end