class Imageset < Ohm::Model
	attribute :photoUrl
	attribute :photoFilePath
	attribute :pictureUrl
	attribute :pictureFilePath

	reference :item, :Item
end
