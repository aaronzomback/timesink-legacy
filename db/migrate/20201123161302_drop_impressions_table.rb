class DropImpressionsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :impressions
  end
end
