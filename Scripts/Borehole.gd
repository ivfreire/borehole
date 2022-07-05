extends Node

export var title = 'Borehole'

# Physical properties
export var depth: float				# in meters
export var inner_radius: float		# in cm
export var outer_radius: float		# in cm

# Radiological parameters
var sources = []
export var activity: float = 0

var container = load('res://Prefabs/Container.tscn')

var gui = false

const N_A: float = 6.022 * pow(10, 23)	# Avogadro's number

func _ready():
	
	# Remove this bit of code later
	self.sources = [
		['A', 10, 611],
		['B', 20, 30],
		['C', 30, 2],
		['D', 40, 150]
	]
	
	$Control/Info/Title.text = self.title
	
	$Casing.translation.y = -self.depth
	$Casing.scale.y = self.depth
	$Bottom.translation.y = - self.depth
	
	$CasingArea/Cylinder.shape.height = self.depth - 2
	$CasingArea/Cylinder.translation.y = - self.depth / 2
	
	# Instanciate containers
	self.create_sources()

	pass

func _physics_process(delta):
	
	# Update sources
	self.update_sources(delta)
	
	# Calculate total activity
	self.activity = 0
	for source in self.sources:
		self.activity += log(2) * source[1] * N_A / source[2]
	
	if $Control.visible:
		$Control/Info.rect_position = $Control.get_global_mouse_position() + Vector2.RIGHT * 24
		$Control/Info/Sources.text = str(len(self.sources))
		
		var text = str(self.activity).split('.')
		
		$Control/Info/Radioactivity.text = "%s.%s x 10^%s" % [text[0][0], text[0][1], len(text[0])]
	
	pass

# Instanciates sources objects
func create_sources():
	for i in len(self.sources):
		var obj = container.instance()
		obj.rotation.y = - PI / 2
		obj.translation.y = 1.3 + i * 3 - self.depth
		self.add_child(obj)
	pass

# Update sources
func update_sources(delta):
	for i in len(self.sources):
		self.sources[i][1] = self.sources[i][1] * (1 - log(2) * delta / self.sources[i][2])

func _on_Area_mouse_entered():
	$Control.visible = true
	pass

func _on_Area_mouse_exited():
	$Control.visible = false
	pass


func _on_CasingArea_mouse_entered():
	$Casing.visible = false
	$Control.visible = true
	pass


func _on_CasingArea_mouse_exited():
	$Casing.visible = true
	$Control.visible = false
	pass # Replace with function body.
