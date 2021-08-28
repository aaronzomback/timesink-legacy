class ChangeIntegerToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :donations, :amount, :float
  end
end
