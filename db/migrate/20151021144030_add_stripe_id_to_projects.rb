class AddStripeIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :stripe_id, :string
  end
end
