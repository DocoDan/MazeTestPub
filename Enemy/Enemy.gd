extends "res://Player/Character.gd"

func _init().(3):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	_can_move=false
	#Random direction 0-3 facing and moving
	facing = _moves.keys()[randi() % 4]

	#Custom Timer do not move before Tilemap is ready
	yield(get_tree().create_timer(0.5),"timeout")
	_can_move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if _can_move:
		#Two Conditions for changing directions
		if not move(facing) or randi() % 10 > 5:
			facing = _moves.keys()[randi() % 4]
