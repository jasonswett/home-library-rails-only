require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = build(:book)
  end

  describe "name is not present" do
    it "is not valid" do
      @book.name = ''
      expect(@book).not_to be_valid
    end
  end

  describe "name is not unique" do
    it "is not valid" do
      @book.save!
      other_book = @book.dup
      expect(other_book).not_to be_valid
    end
  end
end
