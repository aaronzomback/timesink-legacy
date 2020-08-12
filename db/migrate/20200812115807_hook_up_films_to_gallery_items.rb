class HookUpFilmsToGalleryItems < ActiveRecord::Migration[6.0]
  def change
    add_column :gallery_items, :Film_id, :integer
  end
end
