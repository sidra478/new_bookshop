class BooksController < ApplicationController


  def index
    # if params[:search]
    #   @books = Book.search(params[:search]).order("created_at DESC")
    # else
    #   @books = Book.all.order('created_at DESC')
    # end
    @books = Book.all
  end

  def show
   
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
     @book = current_author.books.new(books_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET method for editing a product based on id
  def edit
    @book = Book.find(params[:id])
  end

  # PUT method for updating in database a book based on id
  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = 'Books updated!'
      redirect_to books_path
    else
      flash[:error] = 'Failed to update books!'
      render :edit_book
    end
  end

  # DELETE method for deleting a book from database based on id
  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = 'Book deleted!'
      redirect_to books_path
    else
      flash[:error] = 'Failed to delete this book!'
      render :destroy
    end
  end

  def assign_tags
    @books = Book.all
    @tags = Tag.all
  end

  def assign_book_tags
    book = Book.find(params[:book_id])
    tag = Tag.find(params[:tag_id])
    BooksTag.find_or_create_by(book_id: book.id, tag_id: tag.id)

    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:tile, :description)
  end
end

