extends Sprite2D

@export var move_speed: float = 3.5

static var SPAWN_POSITION: Vector2 = Vector2(900, 35)
static var FINAL_POSITION: float = 66.0

func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position += Vector2(-move_speed,  0)
	if global_position.x < FINAL_POSITION:
		queue_free()

func setup():
	global_position = SPAWN_POSITION
	
	set_process(true)
