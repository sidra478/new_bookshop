require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET index" do
  	  let!(:author) { Author.create(first_name: 'Sidra', last_name: 'Hella Fella', password: 'testchange123', email: 'sidrafareed123@gmail.com' ) }    
  	    it "assigns @books" do
	  	 	book = Book.create(tile: 'Information network secuirty', description:'DR. Usman Inayat', author_id: author.id )
	  	 	get :index
	        expect(assigns(:books)).to eq([book])
        end

        it "renders the index template" do
            get :index
           expect(response).to render_template("index")
        end
    end
end