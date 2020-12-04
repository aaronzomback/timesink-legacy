class AddArtistWebsiteToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :artist_website, :string
  end
end
