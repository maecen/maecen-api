class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :ownerships
  has_many :projects, through: :ownerships

  has_many :subscriptions
  has_many :subscribed_projects, through: :subscriptions, source: :user

  #validates_presence_of :name, :email
  validates_presence_of :phone_number, if: :creative?

  def creative?
    self.account_type == 'creative'
  end
end
