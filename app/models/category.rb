class Category < Ohm::Model
  attribute  :index
  attribute  :label
  attribute  :icon
  attribute  :position
  attribute  :visibility

  collection :items, :Item
end
