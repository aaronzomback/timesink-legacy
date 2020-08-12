class RemoveFilmIdColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :films, :film_id, :integer
  end
end
