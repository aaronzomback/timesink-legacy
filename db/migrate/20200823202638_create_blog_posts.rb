class CreateBlogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :author
      t.string :cover
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5

      t.timestamps
    end
  end
end
