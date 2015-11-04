# encoding: UTF-8

class Project < ActiveRecord::Base
  has_many :ownerships
  has_many :creatives, through: :ownerships, source: :user

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  has_many :contents

  validates_presence_of :title, :description, :teaser
  validates_length_of :description, minimum: 30, maximum: 500
  validates_length_of :teaser, minimum: 10, maximum: 140
  validates :category, included_in: true
  #validate :create_stripe_plan, on: :create

  def create_stripe_plan
    begin
      plan = Stripe::Plan.create(
          :amount => 800,
          :interval => 'month',
          :name => self.title + ' 8kr',
          :currency => 'dkk',
          :id => self.title.gsub(/\s+/, "") + '_800'
      )

      self.plans = { '800': plan.id }
    rescue Stripe::StripeError => e
      self.errors.add :default, e.message
    end
  end

  def self.valid_categories
    %w(Kunst Håndværk Teater Mode Design Video Journalistik Musik Fotografi Teknologi Uddannelse Velgørenhed Web Litteratur Politik Sundhed NGO Personligt\ virke)
  end
end
