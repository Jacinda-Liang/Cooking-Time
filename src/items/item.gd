class_name Item extends Sprite2D  
var item_resource: ItemResource
func _init(item_resource: ItemResource) -> void:
	self.item_resource = item_resource
	texture = item_resource.texture
	
