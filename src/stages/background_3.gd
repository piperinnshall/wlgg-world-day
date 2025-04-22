extends Sprite2D

# Adjust these values to control the sway
@export var amplitude: float = 10.0  # How far it moves (in pixels)
@export var speed: float = 0.4      # How fast it sways
@export var sway_axis: Vector2 = Vector2(1, 0)  # (1,0)=horizontal, (0,1)=vertical

var initial_position: Vector2

func _ready():
	initial_position = position  # Store starting position

func _process(delta):
	# Sine wave oscillation (time-based)
	var offset = sin(Time.get_ticks_msec() * 0.001 * speed) * amplitude
	position = initial_position + (sway_axis * offset)
