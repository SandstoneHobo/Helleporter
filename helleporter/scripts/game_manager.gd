extends Node

var player_position = Vector2(0,0)
var player_can_teleport = false

var experience = 0


func set_player_can_teleport(can_teleport):
	player_can_teleport = can_teleport
	
func can_player_teleport():
	return player_can_teleport

func get_player_position():
	return player_position
	
func set_player_position(position: Vector2):
	player_position = position

func add_experience(amount):
	experience += amount

func get_experience():
	return experience

func _process(delta: float) -> void:
	pass
