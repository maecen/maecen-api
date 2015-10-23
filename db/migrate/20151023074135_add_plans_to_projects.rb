class AddPlansToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :plans, :hstore
    remove_column :projects, :cost
    remove_column :projects, :stripe_id
  end
end
