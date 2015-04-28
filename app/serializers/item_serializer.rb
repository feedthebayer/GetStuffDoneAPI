class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_one :list
end
