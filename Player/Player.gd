extends "res://Player/Character.gd"

signal moved
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _can_move:
		for dir in _movement.keys():
			if Input.is_action_pressed(dir):
				if move(dir):
					emit_signal("moved")
