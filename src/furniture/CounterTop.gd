class_name CounterTop extends GameObject


var item: Item:
	set(value):
		if item != null:
			item.queue_free()
		item = value
		if item: 
			add_child(item)
		


func interact(player:Player)-> void: 
	if player.held_item != null and item == null:
		item=player.drop_item()
		item_placed()
		return
	elif item != null: 
		for recipe in item.item_resource.recipes:
			if recipe.method == Recipe.Method.interact and (recipe.ingredient == null or player.held_item != null and recipe.ingredient == player.held_item.item_resource):
				var created_item: ItemResource = recipe.result
				item = Item.new(created_item)
				if recipe.ingredient != null:  
					player.delete_item()
				return
		if player.held_item != null:
			for recipe in player.held_item.item_resource.recipes:
				if recipe.method == Recipe.Method.interact and recipe.ingredient == item.item_resource:
					var created_item: ItemResource = recipe.result
					item = Item.new(created_item)
					player.delete_item()
					return
	if player.held_item == null and item != null: 
		player.grab_item(item.item_resource)
		item = null


func item_placed() -> void:
	pass
