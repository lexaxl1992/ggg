class Item < Ohm::Model
	attribute  :name
	attribute  :thumbnail #"/uploads/items/thumbs/imgname"
	attribute  :price
	collection :images, :Image
	attribute  :modularity
	attribute  :description
	collection :pictures, :Picture

	reference  :category, :Category
end
