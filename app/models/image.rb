class Image < Ohm::Model
  attribute :url
  attribute :filepath
  attribute :width
  attribute :height
  attribute :caption

  reference :slider
end
