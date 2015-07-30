class AddCatIdToGame < ActiveRecord::Migration
  def change
    add_reference :games, :category, index: true, foreign_key: true
  end
end
