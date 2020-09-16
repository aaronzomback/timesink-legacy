class AddPublishDateToBlogPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_posts, :publish_date, :string
  end
end
