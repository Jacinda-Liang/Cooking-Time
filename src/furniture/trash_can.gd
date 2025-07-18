class_name TrashCan extends GameObject



func interact(player:Player)-> void: 
	if player.held_item != null: 
		player.drop_item().queue_free()
