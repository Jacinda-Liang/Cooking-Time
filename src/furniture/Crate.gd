@tool
class_name Crate extends GameObject


@export var item: ItemResource:
	set(value): 
		item = value
		$ItemIcon.texture = item.texture


func interact(player: Player) -> void:
	player.grab_item(item)
