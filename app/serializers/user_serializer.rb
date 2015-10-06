class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :account_type

  has_many :subscribed_projects, serializer: ProjectSerializer
  has_many :projects
end
