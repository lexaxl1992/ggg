class Image < Ohm::Model
	attribute :url

	reference :item, :Item
end
