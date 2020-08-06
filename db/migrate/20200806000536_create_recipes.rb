class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :meal
      t.text :directions
      t.integer :prep_time

      t.timestamps
    end
  end
end
