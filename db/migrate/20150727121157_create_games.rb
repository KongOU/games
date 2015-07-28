class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.text :description
      t.date :release_date
      t.text :iframe
      t.text :source

      t.timestamps null: false
    end
  end
end
