extends Node

var player_position = Vector2(0,0)
var player_can_teleport = false
@onready var mob_upgrade_timer: Timer = $MobUpgradeTimer

var experience = 0
var mob_level = 1
var max_mob_level = 5

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

func _ready() -> void:
	mob_upgrade_timer.start()

func _on_mob_upgrade_timer_timeout() -> void:
	if mob_level < max_mob_level:
		mob_level += 1
	else:
		mob_upgrade_timer.stop()
	
func get_mob_level():
	return mob_level
