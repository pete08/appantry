class EditRecipModelTitleImgUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :name, :title
    rename_column :recipes, :meal, :image
    add_column :recipes, :source_url, :string
    remove_column :recipes, :directions, :text
    remove_column :recipes, :prep_time, :integer


  end
end
