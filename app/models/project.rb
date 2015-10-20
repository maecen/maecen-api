class Project < ActiveRecord::Base
  has_many :ownerships
  has_many :creatives, through: :ownerships, source: :user

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  validates_presence_of :title, :description, :cost
  validates :category, included_in: true
  validates :cost, numericality: { greater_than_or_equal_to: 800, only_integer: true }

  def self.valid_categories
    %w(Band Musiker Forfatter Journalist Billedkunstner Velgorenhed)
  end
end
