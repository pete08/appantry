class AdditemnameUserItems < ActiveRecord::Migration[6.0]
  def change
    add_column :user_items, :name, :string
  end
end
