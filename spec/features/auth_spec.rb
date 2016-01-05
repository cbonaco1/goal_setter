require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url

    expect(page).to have_button("Create User")
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      visit new_user_url

      fill_in("Username", with: "fred")
      fill_in("Password", with: "password")

      click_button("Create User")

      expect(page).to have_content("fred")
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do

    sign_in_as_christian

    expect(page).to have_content("christian")

  end

end

feature "logging out" do

  it "begins with logged out state"

  it "doesn't show username on the homepage after logout"

end
