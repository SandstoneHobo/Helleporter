extends Node

@onready var sword_upgrades: Node = $SwordUpgrades
@onready var helleport_upgrades: Node = $HelleportUpgrades
@onready var demonic_upgrades: Node = $DemonicUpgrades

func upgrade_sword(level):
	sword_upgrades.activate(level)
	
func upgrade_helleport(level):
	helleport_upgrades.activate(level)

func upgrade_demonic(level):
	demonic_upgrades.activate(level)
	
