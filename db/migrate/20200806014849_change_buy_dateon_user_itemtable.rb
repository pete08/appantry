class ChangeBuyDateonUserItemtable < ActiveRecord::Migration[6.0]
  def change
    change_column :user_items, :buy_date, :date
  end
end
