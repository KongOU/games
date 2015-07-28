class RemoveCatNameFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :cat_name, :string
  end
end
