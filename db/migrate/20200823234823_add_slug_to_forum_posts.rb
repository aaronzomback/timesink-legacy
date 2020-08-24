class AddSlugToForumPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :forum_posts, :slug, :string
    add_index :forum_posts, :slug, unique: true
  end
end
