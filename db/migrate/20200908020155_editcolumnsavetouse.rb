class Editcolumnsavetouse < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :save, :use
  end
end
z