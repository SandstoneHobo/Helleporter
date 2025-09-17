extends Label

@onready var stats: Node = %Stats

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if stats.cur_level < 7:
		text = str(GameManager.get_experience()) + "/" + str(stats.exp_thresholds[str(stats.cur_level + 1)])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stats.cur_level < 7:
		text = str(GameManager.get_experience()) + "/" + str(stats.exp_thresholds[str(stats.cur_level + 1)])
	else:
		text = "Max Level"
