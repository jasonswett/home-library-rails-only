require "rails_helper"

RSpec.feature "Creating a book", type: :feature do
  before do
    user = create(:user)
    login_as(user)

    @new_book_page = NewBookPage.new
  end

  scenario "User creates a new book with title only" do
    @new_book_page.visit
    @new_book_page.fill_in(name: "Cosmos")
    @new_book_page.submit

    expect(page).to have_text("Book was successfully created.")
  end

  scenario "User creates a new book with an author" do
    create(:author, name: "Carl Sagan")

    @new_book_page.visit
    @new_book_page.fill_in(name: "Cosmos")
    @new_book_page.select_author("Carl Sagan")
    @new_book_page.submit

    expect(page).to have_text("Author(s): Carl Sagan")
  end
end
