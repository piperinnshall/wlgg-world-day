extends Sprite2D

@export var move_speed: float = 3.5

var pos_x = 610

func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position += Vector2(-move_speed,  0)
	
	if global_position .x < -545.0 and not $Timer.is_stopped():
		print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()

func setup(target_y: float):
	global_position = Vector2(pos_x, target_y)
	set_process(true)
