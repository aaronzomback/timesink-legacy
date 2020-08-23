class CreateForumPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :forum_posts do |t|
      t.string :title
      t.text :body
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
