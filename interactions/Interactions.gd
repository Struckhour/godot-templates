extends Node
### How to use self variables

# Step 1: Create a function here, which will be called by an interaction
# Step 2: Give the function a "self" arguement which you will pass an event node's self variable into to access its id variable (or just pass the ID by itself)
# Step 3: Access that event's self variables with self_vars[self.id][variablename]
# Recommended: If a function contains multiple states for an event to be in

var self_vars = {}


func room_transition(scene, coords, functions):
	pass
