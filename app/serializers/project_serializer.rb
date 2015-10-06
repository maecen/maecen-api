class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cost

  has_many :creatives, serializer: CreativeSerializer
  has_many :subscribers, serializer: SubscriberSerializer
end
