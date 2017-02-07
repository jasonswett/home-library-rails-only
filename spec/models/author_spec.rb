require 'rails_helper'

RSpec.describe Author, type: :model do
  before do
    @author = build(:author)
  end

  describe "name is not present" do
    it "is not valid" do
      @author.name = ''
      expect(@author).not_to be_valid
    end
  end

  describe "name is not unique" do
    it "is not valid" do
      @author.save!
      other_author = @author.dup
      expect(other_author).not_to be_valid
    end
  end
end
