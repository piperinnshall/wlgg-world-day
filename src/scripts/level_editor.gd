extends Node2D

# Set this to true before the game to add levels
const in_editor: bool = false

var level_name_current = "WHIMSICAL_TOWN"

# How long it takes for the key to reach the critical spot
var km_move_time: float = 1.625
var km_output_arr = [[], []]

# Each level has an array km_times
# km times stores the time to spawn the km
var level_info = {
	"WHIMSICAL_TOWN" = {
		"km_times":  "[[1,1.5,3],[2,4]]",
		"music": load("res://assets/music/Whimsical Town.wav")
	}
}
func _ready() -> void:
	$MusicPlayer.stream = level_info.get(level_name_current).get("music")
	$MusicPlayer.play()
	
	if in_editor:
		Signals.key_listener_press.connect(key_listener_press)
	else:
		var km_times = level_info.get(level_name_current).get("km_times")
		var km_times_arr = str_to_var(km_times)
		
		var counter: int = 0
		for key in km_times_arr:
			
			var button_name: String = ""
			match counter:
				0: 
					button_name = "key_Q"
				1:
					button_name = "key_E"
			
			for delay in key:
				spawn_moving_key(button_name, delay)
		
			counter += 1

func key_listener_press(button_name: String, array_num: int):
	km_output_arr[array_num].append($MusicPlayer.get_playback_position()- km_move_time)

func spawn_moving_key(button_name: String, delay: float):
	await get_tree().create_timer(delay).timeout
	Signals.create_moving_key.emit(button_name)

func _on_music_player_finished() -> void:
	print(km_output_arr)
