class CreateBooksTags < ActiveRecord::Migration[7.0]
  def change
    create_table :books_tags do |t|

      t.timestamps
    end
  end
end
