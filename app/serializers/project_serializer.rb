class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cost, :category

  has_many :creatives, serializer: CreativeSerializer
  has_many :subscribers, serializer: SubscriberSerializer
end
