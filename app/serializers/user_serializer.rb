class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :account_type
end
