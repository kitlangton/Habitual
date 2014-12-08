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

  scenario "user can delete habits" do
    habit = FactoryGirl.create(:habit)
    visit root_path
    click_link "Delete"

    expect(page).not_to have_content habit.name
  end

  scenario "user can edit habits" do
    habit = FactoryGirl.create(:habit)
    visit root_path
    click_link "Edit"

    fill_in "Name", with: "NewName"
    click_button "Save Habit"
    expect(page).not_to have_content habit.name
    expect(page).to have_content "NewName"
  end

end

