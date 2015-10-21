class AddValidAndStripeIdToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :stripe_id, :string
    add_column :subscriptions, :active_until, :datetime
  end
end
