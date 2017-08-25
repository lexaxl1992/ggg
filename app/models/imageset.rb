class Imageset < Ohm::Model
	attribute :photoUrl
	attribute :photoFilePath
	attribute :photoWidth
	attribute :photoHeight

	attribute :pictureUrl
	attribute :pictureFilePath
	attribute :pictureWidth
	attribute :pictureHeight

	reference :item, :Item
end
