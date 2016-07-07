class ItemSerializer < ActiveModel::Serializer
  attributes :id, :body

  belongs_to :list
end
