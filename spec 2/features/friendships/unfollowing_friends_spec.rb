require 'rails_helper'

RSpec.feature "Unfollowing Friend" do
  before do
    @john = User.create(first_name: "John",
                        last_name: "Doe",
                        email: "john@hgs.hiddengeniusproject.org",
                        password: "password", cohort_id: (5), city: "Oakland", cell: (5107779311))
    @sarah = User.create(first_name: "Sarah",
                        last_name: "Anderson",
                        email: "sarah@hgs.hiddengeniusproject.org",
                        password: "password", cohort_id: (5), city: "Oakland", cell: (5107779311))
    login_as(@john)

    @following = Friendship.create(user: @john, friend: @sarah)
  end

  scenario do
    visit "/"

    click_link "My lab"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content(@sarah.full_name + " unfollowed")
  end
end
