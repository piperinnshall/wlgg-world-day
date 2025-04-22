extends Sprite2D

@onready var key_moving = preload("res://src/nodes/key_moving.tscn")

@export var key_name: String = ""

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key_name):
		create_moving_key()

func create_moving_key():
	var km_inst = key_moving.instantiate()
	get_tree().get_root().call_deferred("add_child", km_inst)
	km_inst.setup(position.y)
