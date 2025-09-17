extends Label

@onready var stats: Node = %Stats


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(stats.cur_health) + "/" + str(stats.max_health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(stats.cur_health) + "/" + str(stats.max_health)
