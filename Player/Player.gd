extends "res://Player/Character.gd"

signal moved
#For Aread2D
signal dead
signal grabbed_key
signal win


func _init().(2):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _can_move:
		for dir in _moves.keys():
			if Input.is_action_pressed(dir):
				if move(dir):
					emit_signal("moved")

func _on_Player_area_entered(area):
	print("on area called")
	if area.is_in_group("enemies"):
		emit_signal("dead")
	if area.has_method("pickup"):
		area.pickup()
		if area.type == "key_red":
			emit_signal("grabbed_key")
		if area.type == "star":
			emit_signal("win")



