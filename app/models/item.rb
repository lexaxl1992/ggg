class Item < Ohm::Model
  attribute :name
  attribute :thumbnail
  attribute :price
  attribute :modularity
  attribute :description
  attribute :position
  collection :imagesets, :Imageset

  reference :category, :Category
end
