class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title
      t.string :author
      t.string :cover
      t.text :description
      t.integer :year
      t.boolean :is_top_pick, default: false

      t.timestamps
    end
  end
end
