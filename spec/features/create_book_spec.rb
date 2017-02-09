require "rails_helper"

RSpec.feature "Creating a book", type: :feature do
  before do
    user = create(:user)
    create(:author, name: "Carl Sagan")

    login_as(user)

    @new_book_page = NewBookPage.new
    @new_book_page.visit
  end

  scenario "User creates a new book with title only" do
    @new_book_page.fill_in(name: "Cosmos")
    @new_book_page.submit

    expect(page).to have_text("Book was successfully created.")
  end

  scenario "User creates a new book with an author" do
    @new_book_page.fill_in(name: "Cosmos")
    @new_book_page.select_author("Carl Sagan")
    @new_book_page.submit

    expect(page).to have_text("Author(s): Carl Sagan")
  end
end
