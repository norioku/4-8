class BooksController < ApplicationController
  def top
  end

  def index
    @book = Book.new
    @books =Book.all
  end

  def show
  @books = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
      @books =Book.all
      #render books_path
      render :index
  end
end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)
  else
  render books_path
end
end

def destroy
  book = Book.find(params[:id])
  if book.destroy
  flash[:notice] = "Book was successfully created."
  redirect_to books_path
end
end

  private
    def book_params
      params.require(:book).permit(:title, :body)

  end
end

