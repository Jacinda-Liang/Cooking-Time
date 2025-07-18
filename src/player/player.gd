class_name Player extends CharacterBody2D


var facing_direction: Vector2 = Vector2.RIGHT 
var held_item : Item

func _physics_process(delta:float) -> void:
	var direction: Vector2
	if Input.is_action_pressed("move_up"):
		direction.y = -1
	if Input.is_action_pressed("move_down"):
		direction.y = 1
	if Input.is_action_pressed("move_left"):
		direction.x = -1
	if Input.is_action_pressed("move_right"):
		direction.x = 1
	direction = direction.normalized()
	if direction:
		facing_direction = direction
	$RayCast2D.look_at(position+facing_direction)
	velocity = direction * 80
	move_and_slide()
	if direction == Vector2(0,0):
		$AnimationPlayer.play("still")
	else:
		$AnimationPlayer.play("walk")
	if direction.x < 0: 
		$Sprites.scale.x = -1
	elif direction.x > 0: 
		$Sprites.scale.x = 1


func _input(event:InputEvent)->void:
	if event.is_action_pressed("action"):
		if $RayCast2D.is_colliding():
			var object : GameObject = $RayCast2D.get_collider(0)
			if object != null: 
				object.interact(self)


func grab_item(item_resource:ItemResource)->void:
	if held_item != null:
		return
	var item: Item  = Item.new(item_resource)
	held_item = item
	$Hand.add_child(item)
	
func drop_item()->Item:
	$Hand.remove_child(held_item)
	var item := held_item
	held_item = null
	return item
	
	
	
