extends Node2D

### How to use the Hopeless Oatmeal "Definitely not a clone of RPGMaker's event system" Interaction System

## Perameters:
# id: A string unique to this interaction. Used for acessing self variables in functions. Good to name these after the scene they're in, like "firetemple_pot" or something
# activate on touch: By default, interactions will run when the player object set in Global is touching them, and the player pressed the select button. Enabling this will simply play the event when the player touches it.
# pause_game: turns the pause_game variable in Global on while the event runs, stopping most of the game from running. Turns it off again after.
# pause_input: turns the pause_input variable in Global on while the event runs, stopping player button presses. Turns it off again after.
# has_collision: allows the player and enemies to walk through the event, while still keeping the event trigger collision.
# delete_after_interaction: deletes the event after the player interacts with it.

# play_dialogue: Plays lines of dialogue from a list of tuples. Use this to make flavor text objects, and use run_function for literally anything else.
# run_function: Runs a function in Interactions.gd. It is good practice to pass self as a varaible in these functions, as you will need this to do anything complex.

# You usually want to have has_collision disabled when active_on_touch is enabled, as touch events are impossible to activate without walking through them

@export var id = ""
@export var activate_on_touch = false
@export var pause_game = false
@export var pause_input = true
@export var has_collision = true
@export var delete_after_interaction = false

@export var play_dialogue = []
@export var run_function = ""
#@export var debug_print = ""

var touched = false
var frame_cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !has_collision:
		$CollisionShape2D.disabled = true
	
	if Global.player in $EventTriggerArea.get_overlapping_bodies():
		if !frame_cooldown:
		#print("event yippee")
			if ((Input.is_action_just_pressed("select") and !Global.pause_input) or (activate_on_touch)): #and frame_cooldown == 0:
				frame_cooldown = true
				if pause_game:
					Global.pause_game = true
				if pause_input:
					Global.pause_input = true
					
				if play_dialogue:
					for d in play_dialogue:
						await Global.dialoguebox.display(d[0], d[1])
				
				if run_function:
					await Interactions.call(run_function)
				
				if pause_game:
					Global.pause_game = false
				if pause_input:
					Global.pause_input = false
				if delete_after_interaction:
					queue_free()
				
				
		elif !activate_on_touch:
			frame_cooldown = false
	elif activate_on_touch:
		frame_cooldown = false
	
			
				
