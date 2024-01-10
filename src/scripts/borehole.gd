# Created on Jan 9th, 2024 by Ícaro Freire.
# Dept. of Radioactive Waste Management - SEGRR
# Institute of Nuclear & Energy Research - IPEN/CNEN-SP

extends Node

@export var title: String = "Borehole 0"

# Borehole primary characteristics
@export var depth: float = 30
@export var outer_radius: float = 30
@export var inner_radius: float = 25

func create_structure():
	$Structure/Casing.scale.y = self.depth
	$Structure/Bottom.position.y = -self.depth
	pass

func _ready():
	create_structure()
	pass

func _process(delta):
	pass
