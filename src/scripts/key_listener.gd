extends Sprite2D

@onready var key_moving = preload("res://src/nodes/key_moving.tscn")
@onready var score_text = preload("res://src/nodes/score_press_text.tscn")

@export var key_up: String = "key_Q"
@export var key_down: String = "key_E"

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

func _ready() -> void:
	Signals.create_moving_key.connect(create_moving_key)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(key_up):
		Signals.key_listener_press.emit(key_down, 0)
	elif Input.is_action_just_pressed(key_down):
		Signals.key_listener_press.emit(key_down, 1)
	
	# Make sure the array of keys is not empty
	if key_moving_queue.size() > 0:
		if key_moving_queue.front().has_passed:
			var key_to_pop = key_moving_queue.pop_front()
			key_to_pop.move_speed = 200
			
			var st_instance = score_text.instantiate() as Node2D
			get_tree().get_root().call_deferred("add_child", st_instance)
			st_instance.set_text("MISS")
			st_instance.global_position = global_position - Vector2(100, 200)
			var camera := get_node("../Camera2D")
			if camera:
				camera.trigger_shake()
			Signals.reset_combo.emit()
			
	
		# If key is pressed pop from queue
		if Input.is_action_just_pressed(key_up):
			do_key_pressed(key_up)
		elif Input.is_action_just_pressed(key_down):
			do_key_pressed(key_down)
			

func do_key_pressed(key):
	var key_to_pop = key_moving_queue.pop_front()
	
	var distance_from_passed = abs(key_to_pop.pass_limit - key_to_pop.global_position.x)		
	
	var score_text_str: String = ""
	
	if key_to_pop.this_button_name != key:
		var camera := get_node("../Camera2D")
		if camera:
			camera.trigger_shake()
		score_text_str = "MISS"
		key_to_pop.move_speed = 200
		Signals.reset_combo.emit()
	else:
		if distance_from_passed < perfect_limit:
			Signals.increment_score.emit(perfect_score)
			score_text_str = "PERFECT"
			Signals.increment_combo.emit()
			send_direction(key_to_pop.this_button_name, key_to_pop)
		elif distance_from_passed < great_limit:
			Signals.increment_score.emit(great_score)
			score_text_str = "GREAT"
			Signals.increment_combo.emit()
			send_direction(key_to_pop.this_button_name, key_to_pop)
		elif distance_from_passed < good_limit:
			Signals.increment_score.emit(good_score)
			score_text_str = "GOOD"
			Signals.increment_combo.emit()
			send_direction(key_to_pop.this_button_name, key_to_pop)
		elif distance_from_passed < okay_limit:
			Signals.increment_score.emit(okay_score)	
			score_text_str = "OKAY"
			Signals.increment_combo.emit()
			send_direction(key_to_pop.this_button_name, key_to_pop)
		else:
			var camera := get_node("../Camera2D")
			if camera:
				camera.trigger_shake()
			score_text_str = "MISS"
			key_to_pop.move_speed = 200
			Signals.reset_combo.emit()
	
	var st_instance = score_text.instantiate() as Node2D
	get_tree().get_root().call_deferred("add_child", st_instance)
	st_instance.set_text(score_text_str)
	st_instance.global_position = global_position - Vector2(100, 200)

func send_direction(button_name: String, key_to_pop):
	var vertical_velocity = 200.0  # Set your desired speed here
	
	if button_name == "key_Q": # Up
		key_to_pop.vertical_speed = -vertical_velocity  # Move upward
	else: # down
		key_to_pop.vertical_speed = vertical_velocity   # Move downward

func create_moving_key(button_name: String):
	var km_inst = key_moving.instantiate()
	km_inst.z_index = 30
	if button_name == key_up:
		km_inst.setup(1, button_name) # Glass
	elif button_name == key_down:
		km_inst.setup(2, button_name) # Recycling
	get_tree().get_root().call_deferred("add_child", km_inst)
	key_moving_queue.push_back(km_inst)

func _on_random_spawn_timer_timeout() -> void:
	#create_moving_key()
	$RandomSpawnTimer.wait_time = randf_range(0.4 ,3)
	$RandomSpawnTimer.start()
