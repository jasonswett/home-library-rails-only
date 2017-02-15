class NewBookPage
  include Capybara::DSL

  def visit
    Capybara::visit "/books/new"
  end

  def fill_in(options)
    Capybara::fill_in "Name", with: options[:name]
  end

  def select_author(name)
    Capybara::fill_in "book_author_ids-selectized", with: name
    find('#book_author_ids-selectized').native.send_keys(:return)
  end

  def select_tag(name)
    Capybara::fill_in "book_tag_ids-selectized", with: name
    find('#book_tag_ids-selectized').native.send_keys(:return)
  end

  def submit
    click_button "Create Book"
  end
end
