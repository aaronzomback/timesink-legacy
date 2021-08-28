class CreateNestedComments < ActiveRecord::Migration[6.0]
  def change
    create_table :nested_comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :film, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
