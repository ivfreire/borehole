extends Spatial

enum View { AERIAL, TOP, SIDE }

export var speed: float = 300
export var zoom_speed: float = 5

var view = View.TOP
var velocity = Vector3.ZERO

func _ready():
	pass
	
func _physics_process(delta):
	
	# Moves the view around
	self.velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	self.velocity.z = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	self.translate(velocity * self.speed * delta)
	
	$UI/SideView/Height.text = str(int(self.translation.y)) + ' m'
	
	pass

func _unhandled_input(event):
	if event.is_action_pressed('middle_button'):
		self.change_view()
		
	if event is InputEventMouseButton:
		self.zoom(event.button_index)
	
	pass

# Changes the zoom of the camera
func zoom(button):
	if self.view == View.TOP:
		if button == BUTTON_WHEEL_UP: self.translate(Vector3.DOWN * zoom_speed)
		if button == BUTTON_WHEEL_DOWN: self.translate(Vector3.UP * zoom_speed)
	if self.view == View.SIDE:
		if button == BUTTON_WHEEL_UP: $Camera.size -= zoom_speed
		if button == BUTTON_WHEEL_DOWN: $Camera.size += zoom_speed
	pass

# Changes the current viewport
func change_view():
	if self.view == View.TOP:
		self.rotate_x(PI / 2)
		self.translation = Vector3.ZERO
		
		$Camera.size = 100
		$Camera.projection = Camera.PROJECTION_ORTHOGONAL
		
		$UI/SideView.visible = true
		
		self.view = View.SIDE
		return
		
	if self.view == View.SIDE:
		self.rotation = Vector3.ZERO
		self.translation = Vector3.ZERO
		
		$Camera.projection = Camera.PROJECTION_PERSPECTIVE
		
		$UI/SideView.visible = false
		
		self.view = View.TOP
		return
