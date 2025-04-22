extends Sprite2D

@export var move_speed: float = 3.5

func _process(delta: float) -> void:
	position += Vector2(-move_speed,  0)
	
	if position.x < -545.0:
		print("over")
