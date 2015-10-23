class Project < ActiveRecord::Base
  has_many :ownerships
  has_many :creatives, through: :ownerships, source: :user

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  has_many :contents

  validates_presence_of :title, :description
  validates :category, included_in: true

  def self.valid_categories
    %w(Band Musiker Forfatter Journalist Billedkunstner Velgorenhed)
  end
end
