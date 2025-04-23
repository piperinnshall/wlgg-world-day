extends Node2D

@onready var belt_scene: PackedScene = preload("res://src/nodes/belt.tscn")
@onready var belt_script: Script = preload("res://src/scripts/belt.gd")

@export var spacing: float = 150.0

var last_belt = null

func _ready() -> void:
	propagate()

func _process(_delta: float) -> void:
	if not last_belt or last_belt.global_position.x <= belt_script.SPAWN_POSITION.x - spacing:
		spawn_belt()

func spawn_belt() -> void:
	var b = belt_scene.instantiate()
	b.z_index = 20
	get_tree().get_root().call_deferred("add_child", b)
	b.setup()
	last_belt = b

func propagate():
	var pos_x = belt_script.SPAWN_POSITION.x
	while pos_x >= belt_script.FINAL_POSITION:
		var b = belt_scene.instantiate()
		b.z_index = 20
		get_tree().get_root().call_deferred("add_child", b)
		b.setup()
		b.global_position.x = pos_x
		last_belt = b
		pos_x -= spacing
