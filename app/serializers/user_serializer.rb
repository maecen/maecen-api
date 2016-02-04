class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :country, :zip_code, :nickname, :phone_number

  has_many :subscribed_projects, serializer: ProjectSerializer
  has_many :projects
end
