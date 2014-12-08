require 'rails_helper'

feature "Manage habits" do

  scenario "user can view habits" do
    visit root_path
    expect(page).to have_content "Habits"
  end

  scenario "user can add habits" do
    visit root_path
    click_link "New Habit"
    fill_in "Name", with: "Meditation"
    click_button "Create Habit"

    expect(page).to have_content "Meditation"
  end
end

