class Imageset < Ohm::Model
	attribute :photo_url
	attribute :picture_url

	reference :item, :Item
end
