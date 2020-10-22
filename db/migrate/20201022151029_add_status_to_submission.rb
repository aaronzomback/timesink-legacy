class AddStatusToSubmission < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions, :accepted, :boolean
  end
end
