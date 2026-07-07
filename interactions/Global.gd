extends Node
# Should be added as a global script in Project > Project Settings > Globals

# Paths to nodes that are commonly called. Must be set at the beginning of a scene.
var dialoguebox
var player
var inventory

var pause_game = false
var pause_input = false
var itemtest = "no"

var in_dialogue = false

# ---- SAVING & LOADING ----
# File path where saved variables will be stored
var save_path = "user://savedata.save"

# Save variables
func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	
	# For storing a variable:
	# file.store_var(variable)
	
	print("Saved Data!")


# Load variables
# Generally good to have this ran when the game opens
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		
		# For loading a variable:
		# variable = file.get_var(variable)
		
		print("Loaded Data!")
	else:
		# Handle when save data does not exist
		print("No data saved...")
