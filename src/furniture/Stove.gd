class_name Stove extends CounterTop

func item_placed() -> void:
	for recipe in item.item_resource.recipes:
		if recipe.method == Recipe.Method.stove:
			var created_item: ItemResource = recipe.result
			item = Item.new(created_item)
	
