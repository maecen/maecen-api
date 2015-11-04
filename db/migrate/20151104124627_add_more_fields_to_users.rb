class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :zip_code, :string
    add_column :users, :country, :string
  end
end
