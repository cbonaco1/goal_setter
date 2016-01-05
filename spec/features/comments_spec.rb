require 'rails_helper'

feature 'UserComments' do

  given(:christian) { User.create!(username: "christian", password: "password") }
  given(:zach) { User.create!(username: "zach", password: "password") }

  given!(:christian_goal) do
    Goal.create!(
      user_id: christian.id,
      private?: false,
      title: "My Goal Title"
    )
  end

  scenario 'Users can comment on other users' do
    sign_in_as(zach)
    visit user_url(christian)
    fill_in("Comment", with:"You are doing great!!")
    click_button("Submit Comment")
    expect(page).to have_content("You are doing great!!")
  end

  scenario 'Users can comment on goals' do
    sign_in_as(zach)
    visit goal_url(christian_goal)
    fill_in("Comment", with:"You are also doing great!!")
    click_button("Submit Comment")
    expect(page).to have_content("You are also doing great!!")
  end
end
