class ChangeAcceptedToBeStatusAndAdddefaultInSubmissions < ActiveRecord::Migration[6.0]
  def change
    rename_column :submissions, :accepted, :status
  end
