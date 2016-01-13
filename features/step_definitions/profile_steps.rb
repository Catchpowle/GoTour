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

Given(/^fans have requested the artist$/) do
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
    "Edinburgh, UK", [
      {
        'latitude'     => 55.953252,
        'longitude'    => -3.188267,
        'address'      => 'Edinburgh, UK',
        'state'        => 'Edinburgh',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )
  Geocoder::Lookup::Test.add_stub(
    "Cardiff, UK", [
      {
        'latitude'     => 51.48158100000001,
        'longitude'    => -3.17909,
        'address'      => 'Cardiff, UK',
        'state'        => 'Cardiff',
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
  Geocoder::Lookup::Test.add_stub(
    "Glasgow, UK", [
      {
        'latitude'     => 55.864237,
        'longitude'    => -4.251806,
        'address'      => 'Glasgow, UK',
        'state'        => 'Glasgow',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )
  Geocoder::Lookup::Test.add_stub(
    "Swansea, UK", [
      {
        'latitude'     => 51.62144,
        'longitude'    => -3.943645999999999,
        'address'      => 'Swansea, UK',
        'state'        => 'Swansea',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )
  Geocoder::Lookup::Test.add_stub(
    "Leeds, UK", [
      {
        'latitude'     => 53.8007554,
        'longitude'    => -1.5490774,
        'address'      => 'Leeds, UK',
        'state'        => 'Leeds',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )
  Geocoder::Lookup::Test.add_stub(
    "Bristol, UK", [
      {
        'latitude'     => 51.454513,
        'longitude'    => -2.58791,
        'address'      => 'Bristol, UK',
        'state'        => 'Bristol',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )
  Geocoder::Lookup::Test.add_stub(
    "Newcastle, UK", [
      {
        'latitude'     => 54.978252,
        'longitude'    => -1.61778,
        'address'      => 'Newcastle, UK',
        'state'        => 'Newcastle',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )
  Geocoder::Lookup::Test.add_stub(
    "Nottingham, UK", [
      {
        'latitude'     => 52.95478319999999,
        'longitude'    => -1.1581086,
        'address'      => 'Nottingham, UK',
        'state'        => 'Nottingham',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )

  Geocoder::Lookup::Test.add_stub(
    "Sheffield, UK", [
      {
        'latitude'     => 53.38112899999999,
        'longitude'    => -1.470085,
        'address'      => 'Sheffield, UK',
        'state'        => 'Sheffield',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )

  Geocoder::Lookup::Test.add_stub(
    "Liverpool, UK", [
      {
        'latitude'     => 53.4083714,
        'longitude'    => -2.9915726,
        'address'      => 'Liverpool, UK',
        'state'        => 'Liverpool',
        'state_code'   => '',
        'country'      => 'UK',
        'country_code' => 'UK'
      }
    ]
  )  
  
  2.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "London", country: "UK").artists << Artist.first }
  24.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Edinburgh", country: "UK").artists << Artist.first }
  16.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Cardiff", country: "UK").artists << Artist.first }
  20.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Birmingham", country: "UK").artists << Artist.first }
  12.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Glasgow", country: "UK").artists << Artist.first }
  4.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Swansea", country: "UK").artists << Artist.first }
  22.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Leeds", country: "UK").artists << Artist.first }
  8.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Bristol", country: "UK").artists << Artist.first }
  14.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Newcastle", country: "UK").artists << Artist.first }
  10.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Nottingham", country: "UK").artists << Artist.first }
  18.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Sheffield", country: "UK").artists << Artist.first }
  6.times { Fan.create!(email: Faker::Internet.email, name: Faker::Name.name, password: 'password', password_confirmation: 'password', city: "Liverpool", country: "UK").artists << Artist.first }

end

Then(/^a fan should see the ten cities they have recieved the most requests from$/) do
  page.should have_selector("ul#cities li:nth-child(1)", text: "Edinburgh: 24")
  page.should have_selector("ul#cities li:nth-child(2)", text: "Leeds: 22")
  page.should have_selector("ul#cities li:nth-child(3)", text: "Birmingham: 20")
  page.should have_selector("ul#cities li:nth-child(4)", text: "Sheffield: 18")
  page.should have_selector("ul#cities li:nth-child(5)", text: "Cardiff: 16")
  page.should have_selector("ul#cities li:nth-child(6)", text: "Newcastle: 14")
  page.should have_selector("ul#cities li:nth-child(7)", text: "Glasgow: 12")
  page.should have_selector("ul#cities li:nth-child(8)", text: "Nottingham: 10")
  page.should have_selector("ul#cities li:nth-child(9)", text: "Bristol: 8")
  page.should have_selector("ul#cities li:nth-child(10)", text: "Liverpool: 6")
  expect(page).not_to have_content "Swansea: 4"
end

Then(/^a fan should see their city$/) do
  expect(page).to have_content("London: 1")
end