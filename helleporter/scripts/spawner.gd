extends Node2D

@onready var spawn_cooldown: Timer = $SpawnCooldown
var spawn_on_cooldown = false
var spawn_limit = 3
var monster_path_array = ["res://scenes/demon.tscn"]
var monster_array = []

func attempt_spawn():
	if not spawn_on_cooldown:
		var spawn_count = randi() % spawn_limit + 1
		for num in range(0, spawn_count):
			var monster = monster_array[randi() % monster_array.size()].instantiate()
			monster.global_position.x += randi() % 20 - 10
			monster.global_position.y += randi() % 20 - 10
			add_child(monster)
		spawn_cooldown.start()
		spawn_on_cooldown = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for path in monster_path_array:
		monster_array.append(load(path))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	attempt_spawn()


func _on_spawn_cooldown_timeout() -> void:
	spawn_on_cooldown = false
