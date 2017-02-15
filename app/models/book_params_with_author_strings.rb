class BookParamsWithAuthorStrings
  def initialize(original_params)
    @original_params = original_params
    @values = original_params[:author_ids]
  end

  def looks_like_an_author_name_string?(value)
    value.present? && value.to_i == 0
  end

  def new_author(name)
    author = Author.create!(name: name)
    author.id.to_s
  end

  def handle_huge_numbers
    @values.collect do |value|
      begin
        Author.exists?(id: value)
        value
      rescue ActiveModel::RangeError
        new_author(value)
      end
    end
  end

  def processed_author_ids
    values_with_huge_numbers_stripped_out = handle_huge_numbers

    values_with_huge_numbers_stripped_out.collect do |value|
      if Author.exists?(id: value) || value.blank?
        value
      else
        new_author(value)
      end
    end
  end

  def process
    return @original_params if @values.blank?

    @original_params.merge(author_ids: processed_author_ids)
  end
end
