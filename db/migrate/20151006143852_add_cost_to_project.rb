class AddCostToProject < ActiveRecord::Migration
  def change
    add_column :projects, :cost, :integer, default: 800
  end
end
