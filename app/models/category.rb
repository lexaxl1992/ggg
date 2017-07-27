class Category < Ohm::Model
  attribute  :index
  attribute  :label
  attribute  :icon
  attribute  :visibility

  collection :items, :Item
end
