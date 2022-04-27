class AddForeignKeyToBooksTags < ActiveRecord::Migration[7.0]
  def change
    add_reference :books_tags, :book, null: false, foreign_key: true
    add_reference :books_tags, :tag, null: false, foreign_key: true
  end
end
