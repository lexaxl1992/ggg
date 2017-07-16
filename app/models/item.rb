class Item < Ohm::Model
	attribute :name
	attribute :thumbnail #"/uploads/items/thumbs/imgname"
	attribute :price
	attribute :description
	set :images, :Image
	collection :categories, :Category
end
