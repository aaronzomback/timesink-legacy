class AddDescriptionAndCoverImageToVolume < ActiveRecord::Migration[6.0]
  def change
    add_column :volumes, :description, :text
    add_column :volumes, :cover_image, :string
  end
end
