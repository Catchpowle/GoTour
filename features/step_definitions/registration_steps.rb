Given(/^a User is on the home page$/) do
  visit root_path
end

When(/^a user clicks to register as a fan$/) do
  click_on("Fan")
end

When(/^the user fills in the form with valid registration information$/) do
  fill_in 'Email', :with => 'jon@email.com'
  fill_in 'Name', :with => 'Jon Catchpowle'
  fill_in 'Password', :with => 'password'
  fill_in 'Password confirmation', :with => 'password'
end

When(/^the user clicks sign up$/) do
  click_on("Sign up")
end

Then(/^a fan should be created$/) do
  expect(Fan.all.length).to eq(1)
  expect(Fan.first.email).to eq('jon@email.com')
  expect(Fan.first.name).to eq('Jon Catchpowle')
end

Then(/^I'm taken to the homepage$/) do
  expect(current_path).to eq(root_path)
end
