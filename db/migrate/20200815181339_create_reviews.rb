class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :film, null: false, foreign_key: true
      t.boolean :is_featured, default: false

      t.timestamps
    end
  end
end
