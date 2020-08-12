class AddCoverImageToFilm < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :CoverImage, :string
  end
end
