class Removecontainer < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :container, :string
  end
end
