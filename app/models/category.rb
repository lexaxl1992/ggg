class Category < Ohm::Model
  attribute :index
  attribute :label
  attribute :icon #"/uploads/categories/imgname"
  attribute :visibility
  set :items, :Item
  index :index
end
