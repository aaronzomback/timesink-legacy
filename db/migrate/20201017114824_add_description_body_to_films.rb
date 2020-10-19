class AddDescriptionBodyToFilms < ActiveRecord::Migration[6.0]
  def change
      add_column :films, :description_body, :text
  end
end
