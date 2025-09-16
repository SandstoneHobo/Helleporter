extends Node

@onready var stats: Node = %Stats
@onready var sword: Area2D = %Sword
@onready var helleport_area: Area2D = %HelleportArea

#TODO decide demonic upgrades
func activate(level):
	stats.demonic_influence += 1
	stats.cur_health = stats.max_health
	match level:
		1:
			stats.attack_damage = stats.attack_damage * 2
			stats.helleport_damage = stats.helleport_damage * 2
			print("demon activated")
		2:
			sword.get_child(1).apply_scale(Vector2(2, 2))
			helleport_area.get_child(0).apply_scale(Vector2(2, 2))
		3:
			stats.move_speed += 15
			stats.max_health += 10
			stats.cur_health = stats.max_health
		4:
			stats.attack_damage = stats.attack_damage * 3
			stats.helleport_damage = stats.helleport_damage * 3
		5:
			sword.get_child(1).apply_scale(Vector2(2, 2))
			helleport_area.get_child(0).apply_scale(Vector2(2, 2))
		6:
			stats.move_speed += 25
			stats.max_health += 15
			stats.cur_health = stats.max_health
		7:
			#TODO think of a better level 7 for demonic
			stats.move_speed += 25
			stats.max_health += 15
			stats.cur_health = stats.max_health
			sword.get_child(1).apply_scale(Vector2(2, 2))
			helleport_area.get_child(0).apply_scale(Vector2(2, 2))
			stats.attack_damage = stats.attack_damage * 3
			stats.helleport_damage = stats.helleport_damage * 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
