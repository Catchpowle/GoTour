When(/^a fan visits their profile$/) do
  visit fan_path(Fan.first)
end

Then(/^a fan should see their information$/) do
  expect(page).to have_content("Jon Catchpowle")
end
