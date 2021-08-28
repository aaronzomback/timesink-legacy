class AddVideoToFilm < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :video, :string
  end
end
