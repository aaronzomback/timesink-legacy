class CreateCommentNotifiers < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_notifiers do |t|

      t.timestamps
    end
  end
end
