extends Spatial

enum View { AERIAL, TOP, SIDE }

export var speed: float = 300

var view = View.TOP

func _ready():
	pass
	
func _physics_process(delta):
	
	var velocity = Vector3(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		0,
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	self.translate(velocity * self.speed * delta)
	
	
	
	pass
