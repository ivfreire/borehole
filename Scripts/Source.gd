extends Node
class_name Source 

export var halflife : float		# in secs
export var N: float				# in mols

func _ready():
	self.name = 'Source'
	pass

func _physics_process(delta):
	self.N = self.N * exp( -log(2) * delta / self.halflife)
	pass
