extends Node

# Physical properties
export var depth: float				# in meters
export var inner_radius: float		# in cm
export var outer_radius: float		# in cm

var casing = load('res://Prefabs/Casing.tscn')

func _ready():
	var n = int(depth / 100)
	
	for i in n:
		var obj = casing.instance()
		obj.translation.y = -100 * i
		self.add_child(obj)

	$Bottom.translation = Vector3.DOWN * n * 100

	pass

func _physics_process(delta):
	pass
