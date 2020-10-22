class RemoveStatusFromSubmissions < ActiveRecord::Migration[6.0]
  def change
    remove_column :submissions, :status, :string
  end
end
