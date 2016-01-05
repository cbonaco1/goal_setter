require 'rails_helper'

feature 'Users show page' do
  given(:christian) { User.create!(username: "christian", password: "password") }

  scenario 'Hides private goals from other viewers' do
    sign_in_as(christian)

    goal = Goal.create!(
      user_id: christian.id,
      private?: true,
      title: "My Private Goal Title"
    )

    click_button("Sign Out")

    visit user_url(christian)
    
    expect(page).to_not have_content("My Private Goal Title")

  end

  scenario 'User can see own private goals'

  scenario 'User can make a new goal from their show page'
end
