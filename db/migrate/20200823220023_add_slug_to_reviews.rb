class AddSlugToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :slug, :string
    add_index :reviews, :slug, unique: true
  end
end
