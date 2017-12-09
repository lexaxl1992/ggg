class Spec < Ohm::Model
  attribute :name

  collection :items, :Item
end
