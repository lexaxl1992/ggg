class Picture < Ohm::Model
	attribute :url

	reference :item, :Item
end
