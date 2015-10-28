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

  validates_presence_of :first_name, :last_name
  validates_presence_of :phone_number, if: :creative?
  validates :account_type, included_in:true

  def creative?
    self.account_type == 'creative'
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  def subscribe_to(project)
    self.subscriptions.new(project_id: project.id)
  end

  def self.valid_account_types
    %w(normal creative)
  end
end
