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
		item = player.drop_item()
		return
	elif item != null: 
		for recipe in item.item_resource.recipes:
			if recipe.method == Recipe.Method.interact:
				var created_item : ItemResource = recipe.result
				item= Item.new(created_item)
				return
	if player.held_item ==null and item != null: 
		player.grab_item(item.item_resource)
		item = null
		
		
