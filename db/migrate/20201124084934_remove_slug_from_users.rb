class RemoveSlugFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :slug, :string
  end
end
