extends Sprite2D

@export var move_speed: float = 8.5
@export var vertical_speed: float = 0.0

var pos_x: float = 1940
var pos_y: float = 490

# true if km has passed the allowed input frame
var has_passed: bool = false

# set the point for a failed press
var pass_limit: float = 641

# set to either re or gl
var this_button_name: String = ""

func _init():
	set_process(false)

func _process(delta: float) -> void:
	global_position.x -= move_speed
	global_position.y += vertical_speed * delta  # Apply vertical movement
	
	if global_position.x < pass_limit and not $Timer.is_stopped():
		# print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()
		has_passed = true

func setup(target_frame: int, button_name: String):
	global_position = Vector2(pos_x, pos_y)
	frame = target_frame
	this_button_name = button_name
	#scale.x = 0.6
	#scale.y = 0.6
	
	set_process(true)
	
func _on_destroy_timer_timeout():
	queue_free()
