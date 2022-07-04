extends Node
class_name Source 

export var element: String		# radionuclide
export var halflife : float		# in secs
export var N: float				# in mols

var activity: float

func _ready():
	pass

func _physics_process(delta):
	self.N = self.N * exp( -log(2) * delta / self.halflife)
	pass
