extends Area2D

export (int) var _speed
bool _can_move=true
var _tileSize = 64
var facing = "right"



var _movement = {"left" : Vector2(-1,0),
				"right" : Vector2(1,0),
				"up" : Vector2(0,-1),
				"down" : Vector2(0,1) } 
onready var _raycasts = {"left" : $Raycasts/left,
							"right" : $Raycasts/right,  
							"up" : $Raycasts/up,
							"down" : $Raycasts/down}


func move(dir):

	facing = dir
	$AnimationPlayer.playback_speed = speed
	_can_move = false
	if _raycasts[facing].is_colliding():
		return

	$MovementTween.interpolate_property(self,"position",position,position+_movement[facing] * _tileSize,
	1.0/_speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$MovementTween.start()
	return true
	)

func _on_MovementTween_tween_completed(object, key):
	can_move = true




