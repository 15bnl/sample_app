class BooksController < ApplicationController
  protect_from_forgery
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  
  
  def new
    @books = Book.all
    @book = Book.new
    # @books = Book.all
    # indexの記述必要？
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
      # '/books/new'
    else
      @books = Book.all
      flash.now[:notice] ="error"
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] ="error"
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    if book.destroy  # データ（レコード）を削除
      flash[:notice] = "Book was successfully created"
      redirect_to '/books'  # 投稿一覧画面へリダイレクト
    else
      flash.now[:notice] ="error"
      render :index
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
