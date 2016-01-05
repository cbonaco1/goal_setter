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

  scenario "begins with logged out state" do
    visit new_session_url

    expect(page).not_to have_content("Signed in as:")
  end

  scenario "doesn't show username on the homepage after logout" do
    sign_in_as_christian

    click_button("Sign Out")

    expect(page).not_to have_content("christian")
  end

end
