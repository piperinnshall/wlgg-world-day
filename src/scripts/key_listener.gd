extends Sprite2D

@onready var key_moving = preload("res://src/nodes/key_moving.tscn")
@onready var score_text = preload("res://src/nodes/score_press_text.tscn")

@export var key_up: String = ""
@export var key_down: String = ""

var key_moving_queue = []

#  Score when distance_from_passed is less than the limit 
var perfect_limit: float = 30
var great_limit: float = 50
var good_limit: float = 60
var okay_limit: float = 80
# Else miss the key press

var perfect_score: float = 250
var great_score: float = 100
var good_score: float = 50
var okay_score: float = 20

func _process(delta: float) -> void:
	
	# Make sure the array of keys is not empty
	if key_moving_queue.size() > 0:
		if key_moving_queue.front().has_passed:
			key_moving_queue.pop_front()
	
		# If key is pressed pop from queue
		if Input.is_action_just_pressed(key_up) or Input.is_action_just_pressed(key_down):
			var key_to_pop = key_moving_queue.pop_front()
		
			var distance_from_passed = abs(key_to_pop.pass_limit - key_to_pop.global_position.x)		
			
			var score_text_str: String = ""
			
			if distance_from_passed < perfect_limit:
				Signals.increment_score.emit(perfect_score)
				score_text_str = "PERFECT"
			elif distance_from_passed < great_limit:
				Signals.increment_score.emit(great_score)
				score_text_str = "GREAT"
			elif distance_from_passed < good_limit:
				Signals.increment_score.emit(good_score)
				score_text_str = "GOOD"
			elif distance_from_passed < okay_limit:
				Signals.increment_score.emit(okay_score)	
				score_text_str = "OKAY"
			else:
				score_text_str = "MISS"
			
			#TODO: Animations
			key_to_pop.queue_free()
			
			var st_instance = score_text.instantiate() as Node2D
			get_tree().get_root().call_deferred("add_child", st_instance)
			st_instance.set_text(score_text_str)
			st_instance.global_position = global_position - Vector2(100, 200)

func create_moving_key():
	var km_inst = key_moving.instantiate()
	km_inst.z_index = 30
	get_tree().get_root().call_deferred("add_child", km_inst)
	km_inst.setup(randi() % 9)
	
	key_moving_queue.push_back(km_inst)

func _on_random_spawn_timer_timeout() -> void:
	create_moving_key()
	$RandomSpawnTimer.wait_time = randf_range(0.4 ,3)
	$RandomSpawnTimer.start()
