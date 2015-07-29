class AddProfilepictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profilepicture, :string
  end
end
