class Imageset < Ohm::Model
  attribute :photoUrl
  attribute :photoFilePath
  attribute :photoWidth
  attribute :photoHeight
  attribute :photoCaption

  attribute :pictureUrl
  attribute :pictureFilePath
  attribute :pictureWidth
  attribute :pictureHeight
  attribute :pictureCaption

  reference :item, :Item
end
