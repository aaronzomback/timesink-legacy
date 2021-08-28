class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.string :title
      t.integer :year
      t.text :description
      t.string :film_length
      t.string :film_link
      t.string :film_pw
      t.integer :price
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
