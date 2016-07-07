class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  has_many :lists
end
