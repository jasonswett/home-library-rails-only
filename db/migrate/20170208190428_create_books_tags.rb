class CreateBooksTags < ActiveRecord::Migration[5.0]
  def change
    create_table :books_tags do |t|
      t.references :book, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
    end
    add_index :books_tags, [:book_id, :tag_id], unique: true
  end
end
