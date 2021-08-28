class AddStatustoSubmissions < ActiveRecord::Migration[6.0]
  def change
      add_column :submissions, :status, :string, default: 'in-progress'
  end
end
