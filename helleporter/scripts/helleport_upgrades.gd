extends Node

@onready var stats: Node = %Stats
@onready var helleport_area: Area2D = %HelleportArea

func activate(level):
	stats.helleport_influence += 1
	stats.cur_health = stats.max_health
	match level:
		1:
			helleport_area.get_child(0).apply_scale(Vector2(2, 2))
		2:
			stats.helleport_damage = stats.helleport_damage * 3
		3:
			stats.move_speed += 25
		4:
			stats.helleport_damage = stats.helleport_damage * 3
		5:
			stats.helleport_damage = stats.helleport_damage * 3
		6:
			stats.move_speed += 25
		7:
			helleport_area.get_child(0).apply_scale(Vector2(4, 4))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
