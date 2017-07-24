class Category < Ohm::Model
  attribute  :index
  attribute  :label
  attribute  :icon #"/uploads/categories/imgname"
  attribute  :visibility

  collection :items, :Item
end
