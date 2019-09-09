# require "rails_helper"
#
# RSpec.feature "Users signup" do
#   scenario "with valid credentials" do
#     visit "/"
#
#     click_link "Genius Sign_up"
#     fill_in "First name", with: "John"
#     fill_in "Last name", with: "Doe"
#     fill_in "Email", with: "john@hgs.hiddengeniusproject.org"
#     fill_in "Password",  with: "password"
#     fill_in "Password confirmation",  with: "password"
#     fill_in "City", with: "Oakland"
#     fill_in "Cohort_id", with: 0
#     fill_in "Cell", with: (5107779311)
#
#     click_button "Genius Sign_up"
#
#     expect(page).to have_content("Welcome Genius! You're good.")
#     user = User.last
#     room = Room.last
#     expect(room.name).to eq(user.full_name.split.join('-'))
#
#     visit "/"
#     expect(page).to have_content("John Doe")
#   end
#
#   scenario "with invalid credentials" do
#     visit "/"
#
#     click_link "Genius sign_up"
#     fill_in "First name", with: "john"
#     fill_in "Last name", with: "doe"
#     fill_in "Email", with: "john@hgs.hiddengeniusproject.org"
#     fill_in "Password",  with: "password"
#     fill_in "Password confirmation",  with: "password"
#     fill_in "Cohort_id", with: 0
#     fill_in "Cell", with: "510 777-9311"
#
#     click_button "Genius sign_up"
#
#     expect(cohort_id.to_i)
#     expect(cell.to_i)
#     expect(page).to have_content("First name can't be blank")
#     expect(page).to have_content("Last name can't be blank")
#   end
#
# end
