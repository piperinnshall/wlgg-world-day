extends Node2D

# Set this to true before the game to add levels
const in_editor: bool = false
var level_name_current = "WHIMSICAL_TOWN"
# Each level has an array km times
# km times stores the time to spawn the km
var level_info = {
	"WHIMSICAL_TOWN" = {
		"km_times":  "[1,2,3]"
	}
}
func _ready() -> void:
	if in_editor:
		pass
	else:
		var km_times = level_info.get(level_name_current).get("km_times")
		var km_times_arr = str_to_var(km_times)
		print(km_times_arr)
