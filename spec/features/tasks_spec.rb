require "rails_helper"

RSpec.feature "Tasks", type: :feature do
  scenario "Toggles a task", js: true do
    user = FactoryBot.create(:user)
    project = FactoryBot.create(:project,
                                name: "Rspec task",
                                owner: user)

    task = project.tasks.create!(name: "Finished")

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    click_link "Rspec task"
    check "Finished"
  end
end
