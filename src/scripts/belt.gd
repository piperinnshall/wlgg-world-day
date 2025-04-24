extends Sprite2D

@export var move_speed: float = 3.5

static var SPAWN_POSITION: Vector2 = Vector2(1920 + 600, 540)
static var FINAL_POSITION: float = 1070.0

func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position += Vector2(-move_speed,  0)
	if global_position.x < FINAL_POSITION:
		queue_free()

func setup():
	global_position = SPAWN_POSITION
	scale =  Vector2(1.3, 1.3)
	
	set_process(true)
