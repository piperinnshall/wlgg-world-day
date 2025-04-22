extends Sprite2D

@export var move_speed: float = 3.5

var pos_x = 610
var pos_y = 0

func _init():
	scale.x = 0.5
	scale.y = 0.5
	set_process(false)

func _process(delta: float) -> void:
	global_position += Vector2(-move_speed,  0)
	
	if global_position .x < -545.0 and not $Timer.is_stopped():
		print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()

func setup(target_frame: int):
	global_position = Vector2(pos_x, pos_y)
	frame = target_frame
	set_process(true)
