class RemoveFilmIdColumnFromGalleryItem < ActiveRecord::Migration[6.0]
  def change
      remove_column :gallery_items, :film_id, :integer
    end
end
