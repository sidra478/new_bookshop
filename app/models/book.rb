class Book < ApplicationRecord
	belongs_to :author
	has_many :books_tags, dependent: :destroy
	has_many :tags, through: :books_tags, source: :book
end
