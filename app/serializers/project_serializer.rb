class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :teaser, :description, :category, :homepage, :plans 

  has_many :creatives, serializer: CreativeSerializer
  has_many :subscribers, serializer: SubscriberSerializer
end
