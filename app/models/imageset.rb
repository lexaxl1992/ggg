class Imageset < Ohm::Model
  attribute :photoUrl
  attribute :photoFilePath
  attribute :photoWidth
  attribute :photoHeight
  attribute :photoCaption
  attribute :photoUid

  attribute :pictureUrl
  attribute :pictureFilePath
  attribute :pictureWidth
  attribute :pictureHeight
  attribute :pictureCaption
  attribute :pictureUid

  reference :item, :Item
end
