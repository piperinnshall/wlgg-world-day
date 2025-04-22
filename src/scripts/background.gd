extends Sprite2D

@export var amplitude: float = 10.0      # How far it moves
@export var speed: float = 1.0           # How fast it sways
@export var sway_axis: Vector2 = Vector2(1, 0)  # (1,0)=horizontal, (0,1)=vertical

var initial_position: Vector2

func _ready():
	initial_position = position

func _process(delta):
	var time = Time.get_ticks_msec() * 0.001
	var offset = sin(time * speed) * amplitude
	position = initial_position + (sway_axis * offset)
