extends Sprite2D

@export var key_name: String = ""

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key_name):
		print(key_name)
