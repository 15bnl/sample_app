class BooksController < ApplicationController
  protect_from_forgery
  
  def new
    @books = Book.all
    @book = Book.new
    # @books = Book.all
    # indexの記述必要？
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      # '/books/new'
    else
      @books = Book.all
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books/new'  # 投稿一覧画面へリダイレクト
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
