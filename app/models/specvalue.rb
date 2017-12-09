class Specvalue < Ohm::Model
  attribute :text

  reference :item, :Item
end
