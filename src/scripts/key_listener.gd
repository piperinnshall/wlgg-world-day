extends Sprite2D

@onready var key_moving = preload("res://src/nodes/key_moving.tscn")
@export var key_name: String = ""

var key_moving_queue = []

func _process(delta: float) -> void:
	
	if key_moving_queue.size() > 0:
		if key_moving_queue.front().has_passed:
			key_moving_queue.pop_front()
	
	if Input.is_action_just_pressed(key_name):
		var key_to_pop = key_moving_queue.pop_front()
	
		var distance_from_passed = abs(key_to_pop.pass_limit - key_to_pop.global_position.x)		
		print(distance_from_passed)
	
		key_to_pop.queue_free()

func create_moving_key():
	var km_inst = key_moving.instantiate()
	get_tree().get_root().call_deferred("add_child", km_inst)
	km_inst.setup(frame + 4)
	
	key_moving_queue.push_back(km_inst)

func _on_random_spawn_timer_timeout() -> void:
	create_moving_key()
	$RandomSpawnTimer.wait_time = randf_range(0.4 ,3)
	$RandomSpawnTimer.start()
