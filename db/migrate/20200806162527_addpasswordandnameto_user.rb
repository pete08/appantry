class AddpasswordandnametoUser < ActiveRecord::Migration[6.0]
  def change
    add_colu qmn :users, :name, :string
    add_column :users, :password_digest, :string
  end
end
