class NewBookPage
  include Capybara::DSL

  def visit
    Capybara::visit "/books/new"
  end

  def fill_in(options)
    Capybara::fill_in "Name", with: options[:name]
  end

  def select_author(name)
    find('label', text: name).click
  end

  alias_method :select_tag, :select_author

  def submit
    click_button "Create Book"
  end
end
