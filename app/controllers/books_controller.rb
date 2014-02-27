class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  private
    def book_params
      params.require(:book).permit(:title, :rating, :read)
    end

end
