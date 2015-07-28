class AddCatIdToGame < ActiveRecord::Migration
  def change
    add_reference :games, :Category, index: true, foreign_key: true
  end
end
