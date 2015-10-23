class Content < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :title, :cost
end
