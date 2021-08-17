class AddSlugToVolumes < ActiveRecord::Migration[6.0]
  def change
    add_column :volumes, :slug, :string
    add_index :volumes, :slug, unique: true
  end
end
