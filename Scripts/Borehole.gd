extends Node

export var title = 'Borehole 1'

# Physical properties
export var depth: float				# in meters
export var inner_radius: float		# in cm
export var outer_radius: float		# in cm

# Radiological parameters
export var sources: int = 1
export var activity: float = 10

var casing = load('res://Prefabs/Casing.tscn')
var gui = false

func _ready():
	$Control/Info/Title.text = self.title
	
	var n = int(depth / 100)
	
	for i in n:
		var obj = casing.instance()
		obj.translation.y = -100 * i
		self.add_child(obj)

	$Bottom.translation = Vector3.DOWN * n * 100

	pass

func _physics_process(delta):
	
	if $Control.visible:
		$Control/Info.rect_position = $Control.get_global_mouse_position() + Vector2.RIGHT * 24
		
		$Control/Info/Sources.text = str(self.sources)
		$Control/Info/Radioactivity.text = str(self.activity)
	
	pass


func _on_Area_mouse_entered():
	$Control.visible = true
	pass

func _on_Area_mouse_exited():
	$Control.visible = false
	pass
