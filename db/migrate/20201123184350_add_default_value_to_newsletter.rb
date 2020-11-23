class AddDefaultValueToNewsletter < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :newsletter, :boolean, default: true
  end
end
