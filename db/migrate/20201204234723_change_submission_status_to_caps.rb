class ChangeSubmissionStatusToCaps < ActiveRecord::Migration[6.0]
  def change
    change_column :submissions, :status, :string, default: 'Received'
  end
end
