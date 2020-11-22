class RemoveNewsletterFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :newsletter, :boolean
  end
end
