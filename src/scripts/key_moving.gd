extends Sprite2D

@export var move_speed: float = 3.5

var pos_x: float = 610
var pos_y: float = 0

# true if km has passed the allowed input frame
var has_passed: bool = false

var pass_limit: float = -565.0

func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position += Vector2(-move_speed,  0)
	
	if global_position.x < pass_limit and not $Timer.is_stopped():
		print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()
		has_passed = true

func setup(target_frame: int):
	global_position = Vector2(pos_x, pos_y)
	frame = target_frame
	scale.x = 0.3
	scale.y = 0.3
	
	set_process(true)
	
func _on_destroy_timer_timeout():
	queue_free()
