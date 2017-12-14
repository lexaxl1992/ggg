class Spec < Ohm::Model
  attribute :name
  attribute :value

  reference :item, :Item
end
