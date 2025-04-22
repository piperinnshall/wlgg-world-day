extends Sprite2D

@export var move_speed: float = 3.5
@export var spawn_position: Vector2 = Vector2(900, 35)
@export var final_position: float = 66.0


func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position += Vector2(-move_speed,  0)
	if global_position.x < final_position:
		queue_free()

func setup():
	global_position = spawn_position
	
	set_process(true)
