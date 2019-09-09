require "rails_helper"

RSpec.feature "Showing Friend Project" do
  before do
    @john = User.create!(first_name: "John",
                        last_name: "Doe",
                        email: "john@hgs.hiddengeniusproject.org",
                        password: "password", cohort_id: 5, city: "Oakland", cell: (5107779311))

    @sarah = User.create!(first_name: "Sarah",
                        last_name: "Anderson",
                        email: "sarah@hgs.hiddengeniusproject.org",
                        password: "password", cohort_id: 5, city: "Oakland", cell: (5107779311))

    @e1 = @john.projects.create!(app_name: "My App",
                                coding: "language",
                                project_details: "das shyt",
                                start_date: Date.today)
    @e2 = @sarah.projects.create!(app_name: "My App",
                                 coding: "language",
                                 project_details: "das shyt",
                                 start_date: Date.today)
    login_as(@john)

    @following = Friendship.create!(user: @john, friend: @sarah)
  end

  scenario "shows friend's projects" do
    visit "/"

    click_link "My lab"
    click_link @sarah.full_name


    expect(page).to have_content(@sarah.full_name + "'s projects")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end

end
