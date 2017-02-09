require "rails_helper"

RSpec.feature "Creating a book", type: :feature do
  scenario "User creates a new book" do
    user = FactoryGirl.create(:user)
    login_as(user)

    visit "/books/new"

    fill_in "Name", with: "Cosmos"
    click_button "Create Book"

    expect(page).to have_text("Book was successfully created.")
  end
end
