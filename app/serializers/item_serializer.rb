class ItemSerializer < ActiveModel::Serializer
  attributes :id, :body, :complete

  belongs_to :list
end
