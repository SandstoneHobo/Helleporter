extends Node

@onready var stats: Node = %Stats
@onready var sword: Area2D = %Sword

func activate(level):
	stats.sword_influence += 1
	stats.cur_health = stats.max_health
	match level:
		1:
			stats.attack_damage = stats.attack_damage * 3
		2:
			sword.get_child(1).apply_scale(Vector2(2, 2))
		3:
			stats.max_health += 15
			stats.cur_health = stats.max_health
		4:
			stats.attack_damage = stats.attack_damage * 3
		5:
			stats.max_health += 20
			stats.cur_health = stats.max_health
		6:
			stats.max_health += 30
			stats.cur_health = stats.max_health
		7:
			stats.attack_damage = stats.attack_damage * 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
