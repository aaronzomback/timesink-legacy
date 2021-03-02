class AddNoteToDonations < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :note, :text
  end
end
