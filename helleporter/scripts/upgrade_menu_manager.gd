extends CanvasLayer

@onready var upgrade_manager: Node = %UpgradeManager
@onready var stats: Node = %Stats
@onready var sword_upgrade: Button = $HBoxContainer/SwordUpgrade
@onready var helleport_upgrade: Button = $HBoxContainer/HelleportUpgrade
@onready var demonic_upgrade: Button = $HBoxContainer/DemonicUpgrade

var sword_desc = ["3x Sword Damage", "2x Sword Area", "+15 Max Health", "3x Sword Damage", "+20 Max Health", "+30 Max Health", "5x Sword Damage"]
var helleport_desc = ["2x Helleport Area", "3x Helleport Damage", "+15% Movespeed", "3x Helleport Damage", "3x Helleport Damage", "+15% Movespeed", "4x Helleport Area"]
var demonic_desc = ["2x All Damage", "2x All Area", "+15% Movespeed \n+10 Max Health", "3x All Damage", "2x All Area", "+15% Movespeed \n+15 Max Health", "+15% Movespeed \n+15 Max Health \n2x All Area \n3xAll Damage"]

func toggle_menu():
	visible = not visible
	
func open_menu():
	get_tree().paused = true
	sword_upgrade.text = "Sword Upgrade\n\n" + sword_desc[stats.cur_level - 1]
	helleport_upgrade.text = "Helleport Upgrade\n\n" + helleport_desc[stats.cur_level - 1]
	demonic_upgrade.text = "Demonic Upgrade\n\n" + demonic_desc[stats.cur_level - 1]
	toggle_menu()
	
func close_menu():
	get_tree().paused = false
	toggle_menu()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_sword_upgrade_pressed() -> void:
	upgrade_manager.upgrade_sword(stats.cur_level)
	close_menu()


func _on_helleport_upgrade_pressed() -> void:
	upgrade_manager.upgrade_helleport(stats.cur_level)
	close_menu()


func _on_demonic_upgrade_pressed() -> void:
	upgrade_manager.upgrade_demonic(stats.cur_level)
	close_menu()
