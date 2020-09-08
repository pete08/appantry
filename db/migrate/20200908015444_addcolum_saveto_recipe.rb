class AddcolumSavetoRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :save, :string
  end
end
