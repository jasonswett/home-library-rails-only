require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = build(:tag)
  end

  describe "name is not present" do
    it "is not valid" do
      @tag.name = ''
      expect(@tag).not_to be_valid
    end
  end

  describe "name is not unique" do
    it "is not valid" do
      @tag.save!
      other_tag = @tag.dup
      expect(other_tag).not_to be_valid
    end
  end
end
