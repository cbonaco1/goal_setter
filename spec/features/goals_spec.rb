require 'rails_helper'

feature 'Users show page' do
  given(:christian) { User.create!(username: "christian", password: "password") }
  given(:zach) { User.create!(username: "zach", password: "password") }

  given!(:christian_private_goal) do
    Goal.create!(
      user_id: christian.id,
      private?: true,
      title: "My Private Goal Title"
    )
  end

  given!(:christian_public_goal) do
    Goal.create!(
      user_id: christian.id,
      private?: false,
      title: "My Public Goal Title"
    )
  end

  scenario 'Users can view public goals' do
    visit user_url(christian)
    expect(page).to have_content(christian_public_goal.title)
  end

  scenario 'Hides private goals from other viewers' do
    visit user_url(christian)
    expect(page).to_not have_content(christian_private_goal.title)
  end

  scenario 'User can see own private goals' do
    sign_in_as(christian)
    visit user_url(christian)
    expect(page).to have_content(christian_private_goal.title)
  end

  scenario 'User can make a new goal from their show page' do
    sign_in_as(christian)
    visit user_url(christian)
    click_link("New Goal")
    fill_in("Title", with: "New Goal Title")
    fill_in("Description", with: "Goal Description")
    page.uncheck('private_checkbox')
    click_button("Add Goal")
    expect(page).to have_content("New Goal Title")
  end

  scenario 'User can edit their goals' do
    sign_in_as(christian)
    click_link("My Public Goal Title")
    click_link("Edit Goal")
    fill_in("Title", with: "My NEW Public Goal Title")
    click_button("Update Goal")
    expect(page).to have_content("My NEW Public Goal Title")
  end

end
