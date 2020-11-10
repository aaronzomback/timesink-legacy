class AddTrailerToFilms < ActiveRecord::Migration[6.0]
    def change
      add_column :films, :trailer, :string
    end
  end
