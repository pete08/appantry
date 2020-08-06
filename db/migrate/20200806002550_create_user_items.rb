class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items do |t|
      t.integer :item_id
      t.integer :user_id
      t.datetime :buy_date
      t.boolean :used
      t.boolean :future_interest

      t.timestamps
    end
  end
end
