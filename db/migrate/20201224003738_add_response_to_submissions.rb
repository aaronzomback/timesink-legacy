class AddResponseToSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions, :response, :text
  end
end
