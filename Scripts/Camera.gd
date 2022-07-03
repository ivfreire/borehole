extends Spatial

enum View { AERIAL, TOP, SIDE }

export var speed: float = 300

var view = View.TOP

func _ready():
	pass
	
func _physics_process(delta):
	
	# Moves the view around
	var velocity = Vector3.ZERO
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.z = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	self.translate(velocity * self.speed * delta)
	
	pass

func _unhandled_input(event):
	if event.is_action_pressed("middle_button"):
		self.change_view()
	pass

# Changes the current viewport
func change_view():
	if self.view == View.TOP:
		self.rotate_x(PI / 2)
		self.translation = Vector3.ZERO
		
		$Camera.size = 100
		$Camera.projection = Camera.PROJECTION_ORTHOGONAL
		
		self.view = View.SIDE
		return
		
	if self.view == View.SIDE:
		self.rotation = Vector3.ZERO
		self.translation = Vector3.ZERO
		
		$Camera.projection = Camera.PROJECTION_PERSPECTIVE
		
		self.view = View.TOP
		return
