extends CanvasLayer

@onready var upgrade_manager: Node = %UpgradeManager
@onready var stats: Node = %Stats

func toggle_menu():
	visible = not visible

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_sword_upgrade_pressed() -> void:
	upgrade_manager.upgrade_sword(stats.cur_level)
	toggle_menu()


func _on_helleport_upgrade_pressed() -> void:
	upgrade_manager.upgrade_helleport(stats.cur_level)
	toggle_menu()


func _on_demonic_upgrade_pressed() -> void:
	upgrade_manager.upgrade_demonic(stats.cur_level)
	toggle_menu()
