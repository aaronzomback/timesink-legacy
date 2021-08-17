class CreateVolumes < ActiveRecord::Migration[6.0]
  def change
    create_table :volumes do |t|
      t.string :title

      t.timestamps
    end
  end
end
