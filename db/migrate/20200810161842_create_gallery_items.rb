class CreateGalleryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :gallery_items do |t|
      t.string :title
      t.string :image
      t.string :author
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
