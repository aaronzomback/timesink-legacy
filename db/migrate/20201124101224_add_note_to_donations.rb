class AddNoteToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :note, :text_area
  end
end
