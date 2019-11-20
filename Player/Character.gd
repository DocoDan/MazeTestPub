#The base scene for all sorts of Characters
#-Player and enemies will inherit from it
#-adapt collision and mask layer
#-Texture for Animation Player
#-change base node title
#-add Camera for Player

#any changes in this scene will affect the child scene

extends Area2D

export (int) var speed
#Is this for keyboard Input?
var _can_move=true
var _tileSize = 64
var facing = "right"




var _moves = {"left" : Vector2(-1,0),
				"right" : Vector2(1,0),
				"up" : Vector2(0,-1),
				"down" : Vector2(0,1) } 
onready var _raycasts = {"left" : $Raycasts/left,
							"right" : $Raycasts/right,  
							"up" : $Raycasts/up,
							"down" : $Raycasts/down}



func _init(_speed = 1).():
	speed =_speed
	#health = _health

func move(dir):
	$AnimationPlayer.playback_speed= speed
	$AnimationPlayer.playback_speed= 4
	facing = dir
	if _raycasts[facing].is_colliding():
		#No movement here
		return false

	_can_move = false	
	#Select the correct animation this is probably something for a State machine
	$AnimationPlayer.play(facing)
	$MoveTween.interpolate_property(self,"position",
	position,position+_moves[facing] * _tileSize, 1.0/speed, Tween.TRANS_SINE,Tween.EASE_OUT)
	$MoveTween.start()
	return true

#After movement is complete make Keyboard input possible again
func _on_MoveTween_completed(object, key):
	_can_move = true


