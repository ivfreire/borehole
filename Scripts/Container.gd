extends Node

func _ready():
	pass


func _on_Area_mouse_entered():
	$Control.visible = true

func _on_Area_mouse_exited():
	$Control.visible = false
