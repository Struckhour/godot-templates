extends CharacterBody2D

# Requires inputs to be set in Project > Project Settings > Input Map


# horizontal movement speed
@export var speed = 500

# total x velocity excluding player input (left and right buttons)
var x_force = 0
# total y velocity excluding player input (up and down buttons)
var y_force = 0


func _physics_process(delta: float) -> void:
	# If the game is multiplayer, put at the beginning of this function:
	# if !is_multiplayer_authority():
		 #return
	
	# Set velocity
	velocity.x = Input.get_axis("left", "right") * speed
	velocity.y = Input.get_axis("up", "down") * speed
	
	move_and_slide()
