class CreateAuthorsBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :authors_books do |t|
      t.references :book, foreign_key: true, null: false
      t.references :author, foreign_key: true, null: false

      t.timestamps
    end
    add_index :authors_books, [:book_id, :author_id], unique: true
  end
end
