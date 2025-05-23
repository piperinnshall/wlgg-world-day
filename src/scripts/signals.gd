extends Node2D

signal increment_score(increment: int)

signal increment_combo()
signal reset_combo()

signal create_moving_key(button_name: String)
signal key_listener_press(button_name: String, array_num: int)

signal high_score(score: int)
