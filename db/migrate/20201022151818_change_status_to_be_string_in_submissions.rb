class ChangeStatusToBeStringInSubmissions < ActiveRecord::Migration[6.0]
  def change
    change_column :submissions, :accepted, :string
  end
end
