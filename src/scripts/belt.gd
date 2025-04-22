extends Sprite2D

@export var move_speed: float = 3.5

var pos_x: float = 900
var pos_y: float = 35

func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position += Vector2(-move_speed,  0)
	if global_position.x < 66:
		queue_free() 
	

func setup():
	global_position = Vector2(pos_x, pos_y)
	
	set_process(true)
