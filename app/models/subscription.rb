class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_uniqueness_of :project_id, :scope => :user_id

  #validate :stripe_validation, on: :create
  #validates_presence_of :stripe_id

  def stripe_validation
    begin
      stripe_sub = Stripe::Customer.retrieve(self.user.stripe_id).subscriptions.create(plan: self.project.plans['800'])
      self.stripe_id = stripe_sub.id
    rescue Stripe::StripeError => e
      self.errors.add :default, e.message
    end
  end

  def available_contents
    Content.where("project_id = ? and cost <= ?", self.project_id, self.amount)
  end
end
