class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :tile
      t.string :description

      t.timestamps
    end
  end
end
