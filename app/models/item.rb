class Item < Ohm::Model
	attribute  :name
	attribute  :thumbnail #"/uploads/items/thumbs/imgname"
	attribute  :price
	collection :photos, :Image
	attribute  :modularity
	attribute  :description
	collection :pictures, :Image

	reference  :category, :Category
end
