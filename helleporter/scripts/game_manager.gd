extends Node

var player_position = Vector2(0,0)

func get_player_position():
	return player_position
	
func set_player_position(position: Vector2):
	player_position = position
	
func _process(delta: float) -> void:
	pass
