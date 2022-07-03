extends Node

# Physical properties
export var depth: float				# in meters
export var inner_radius: float		# in cm
export var outer_radius: float		# in cm

func _ready():
	print('Borehole')
	
	var casing = self.get_node('Casing')
	self.add_child(casing)
	
	pass
