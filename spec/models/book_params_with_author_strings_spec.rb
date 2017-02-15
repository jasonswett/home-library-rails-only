require 'rails_helper'

RSpec.describe BookParamsWithAuthorStrings, type: :model do

  describe "#process" do
    before do
      @existing_author = FactoryGirl.create(:author)

      original_values = ["", @existing_author.id.to_s, "Stephen Covey"]
      params = BookParamsWithAuthorStrings.new(author_ids: original_values)
      @new_values = params.process
      @stephen_covey = Author.find_by(name: "Stephen Covey")
    end

    it "includes the id of the new author" do
      expect(@new_values[:author_ids]).to include(@stephen_covey.id.to_s)
    end

    it "includes any existing ids" do
      expect(@new_values[:author_ids]).to include(@existing_author.id.to_s)
    end

    it "handles names that are numbers" do
      author_name = "111111111"
      params = BookParamsWithAuthorStrings.new(author_ids: [author_name])
      params.process
      expect(Author.find_by(name: author_name)).to be_present
    end

    it "handles names that are huge numbers" do
      author_name = "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
      params = BookParamsWithAuthorStrings.new(author_ids: [author_name])
      new_values = params.process

      new_author = Author.find_by(name: author_name)

      expect(new_values[:author_ids]).to include(new_author.id.to_s)
    end
  end

  describe '#handle_huge_numbers' do
    it "handles names that are huge numbers" do
      author_name = "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
      params = BookParamsWithAuthorStrings.new(author_ids: [author_name])
      new_values = params.handle_huge_numbers

      new_author = Author.find_by(name: author_name)

      expect(new_values).to eq([new_author.id.to_s])
    end

    it "preserves any legitimate ids" do
      author_name = "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111"
      legitimate_author = FactoryGirl.create(:author)

      params = BookParamsWithAuthorStrings.new(author_ids: [legitimate_author.id.to_s, author_name])
      new_values = params.handle_huge_numbers

      new_author = Author.find_by(name: author_name)

      expect(new_values).to include(legitimate_author.id.to_s)
    end
  end
end