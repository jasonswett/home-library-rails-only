class Book < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :tags

  def author_names
    authors.map(&:name).join(', ')
  end

  def tag_names
    tags.map(&:name).join(', ')
  end
end
