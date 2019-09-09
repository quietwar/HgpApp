require "rails_helper"

RSpec.feature "Following Friends" do
  before do
    @john = User.create(first_name: "John",
                        last_name: "Doe",
                        email: "john@hgs.hiddengeniusproject.org",
                        password: "password", cohort_id: 0, cell: (5107779311))

    @peter = User.create(first_name: "Peter",
                        last_name: "Corn",
                        email: "peter@hgs.hiddengeniusproject.org",
                        password: "password", cohort_id: 0, cell: (5107779311))
    login_as(@john)
  end

  scenario "if signed in" do
    visit "/"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@peter.full_name)

    href = "/friendships?friend_id=#{@john.id}"
    expect(page).not_to have_link("Follow", :href => href)

    link = "a[href='/friendships?friend_id=#{@peter.id}']"
    find(link).click

    href = "/friendships?friend_id=#{@peter.id}"
    expect(page).not_to have_link("Follow", :href => href)
  end

end
