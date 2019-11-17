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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

