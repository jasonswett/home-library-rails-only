class API::V1::BooksController < API::V1::APIController
  skip_before_action :authenticate_user!

  def index
    @books = Book.all

    render json: @books
  end
end
