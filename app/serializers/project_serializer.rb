class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :plans

  has_many :creatives, serializer: CreativeSerializer
  has_many :subscribers, serializer: SubscriberSerializer
end
