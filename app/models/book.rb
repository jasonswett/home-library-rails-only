class Book < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :tags

  def author_names
    comma_separated_list(:authors)
  end

  def tag_names
    comma_separated_list(:tags)
  end

  def comma_separated_list(association_name)
    send(association_name).map(&:name).join(', ')
  end
end