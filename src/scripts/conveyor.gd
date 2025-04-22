extends Node2D

@onready var belt = preload("res://src/nodes/belt.tscn")

var spawn_delay: float  = 0.5
var spawn_timer: float  = 0.0

func _process(delta: float) -> void:
	spawn_timer += delta
	if spawn_timer >= spawn_delay:
		create_moving_belt()
		spawn_timer = 0.0

func create_moving_belt():
	var b_inst = belt.instantiate()
	b_inst.z_as_relative = false
	b_inst.z_index = 20
	get_tree().get_root().call_deferred("add_child", b_inst)
	b_inst.setup()
