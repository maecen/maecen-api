class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validate :stripe_validation, on: :create
  validates_presence_of :stripe_id

  def stripe_validation
    begin
      stripe_sub = Stripe::Customer.retrieve(self.user.stripe_id).subscriptions.create(plan: self.project.stripe_id)
      self.stripe_id = stripe_sub.id
    rescue Stripe::StripeError => e
      self.errors.add :default, e.message
    end
  end
end
