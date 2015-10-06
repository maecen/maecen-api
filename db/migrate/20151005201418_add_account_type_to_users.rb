class AddAccountTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_type, :string, default: 'normal'
  end
end
