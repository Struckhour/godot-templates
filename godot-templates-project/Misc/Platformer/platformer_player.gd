extends CharacterBody2D

# Requires inputs to be set in Project > Project Settings > Input Map


# horizontal movement speed
@export var speed = 500
# upward momentum applied when the player jumps
@export var jump_force = 500
# downward momentum applied per frame
@export var gravity = 10

# total x velocity excluding player input (left and right buttons)
var x_force = 0
# total y velocity
var y_force = 0


func _physics_process(delta: float) -> void:
	# If the game is multiplayer, put at the beginning of this function:
	# if !is_multiplayer_authority():
		 #return
	
	# Calculate vertical movement
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			y_force = -jump_force
	else:
		y_force += gravity
	
	# Set velocity
	velocity.x = Input.get_axis("left", "right") * speed + x_force
	velocity.y = y_force
	
	move_and_slide()
