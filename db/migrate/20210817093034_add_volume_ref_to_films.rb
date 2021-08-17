class AddVolumeRefToFilms < ActiveRecord::Migration[6.0]
  def change
    add_reference :films, :volume, foreign_key: true
  end
end
