 require 'rails_helper'

RSpec.describe Author, type: :model do

	let!(:author) { Author.create(first_name: 'Sidra', last_name: 'BulBul', password: 'testchange123', email: 'sidrafareed123@gmail.com' ) }

	it 'will create author' do 
		expect(author.first_name).to eq 'Sidra'
	end

	it 'will create author' do 
		expect(author.last_name).to eq 'BulBul'
	end

    it 'will create author' do 
    	expect(author.email).to eq 'sidrafareed123@gmail.com'
    end
end