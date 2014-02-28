class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create

    if params[:book][:img_data]
      data = params[:book][:img_data].read
      original_filename = params[:book][:img_data].original_filename
      content_type = params[:book][:img_data].content_type
    end
    @book = Book.new(book_params) do |t|

      t.img_data      = data
      t.img_filename  = original_filename
      t.img_mime_type = content_type
    end    

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def serve
    @book = Book.find(params[:id])

    send_data(@book.img_data, :type => @book.img_mime_type, :filename => @book.img_filename, :disposition => "inline")
  end
  helper_method :serve

  def index
    @books = Book.all
  end

  private
    def book_params
      params.require(:book).permit(:title, :rating, :read, :img_data)
    end

end
