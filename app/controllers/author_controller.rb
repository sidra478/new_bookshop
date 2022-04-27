class AuthorController < ApplicationController

  def index
    @author = Author.all
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
  end

  def create

    @author = Author.new(params[:author_params])
    if author.save!
    	redirect_to author_path(@author)
    else
    	render :new, status: :unprocessable_entity
  end

  def edit
    @author = Author.find(params[:id])
  end

  # PUT method for updating in database a author based on id
  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = 'author updated!'
      redirect_to author_path
    else
      flash[:error] = 'Failed to update author!'
      render :edit_author
    end
  end


  def logout_author
    binding.pry
    @author = Author.find(params[:author_id])
    session.delete(@author)
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :password, :confirmation_password)
  end



end




