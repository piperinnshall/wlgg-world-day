extends Node2D

@export var belt_scene: PackedScene = preload("res://src/nodes/belt.tscn")
@export var spacing: float = 150.0

var last_belt = null

func _ready() -> void:
	propogate()

func _process(_delta: float) -> void:
	if not last_belt or last_belt.global_position.x <= last_belt.spawn_position.x - spacing:
		spawn_belt()

func spawn_belt() -> void:
	var b = belt_scene.instantiate()
	b.z_as_relative = false
	b.z_index = 20
	get_tree().get_root().call_deferred("add_child", b)
	b.setup()
	last_belt = b
	
func propogate():
	var temp_belt = belt_scene.instantiate()
	var start_x = temp_belt.spawn_position.x
	var end_x = temp_belt.final_position
	temp_belt.queue_free()

	var pos_x = start_x
	while pos_x >= end_x:
		var b = belt_scene.instantiate()
		b.z_as_relative = false
		b.z_index = 20
		get_tree().get_root().call_deferred("add_child", b)
		b.setup()
		b.global_position.x = pos_x
		last_belt = b
		pos_x -= spacing
