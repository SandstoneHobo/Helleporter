extends CharacterBody2D

@onready var teleport_timer: Timer = $TeleportTimer
@onready var sword: Area2D = $Sword
@onready var skin: Sprite2D = $Skin
@onready var game_manager: Node = %GameManager
@onready var stats: Node = $Stats

var teleport_on_cooldown := false

func deal_damage():
	sword.attack()

func take_damage(amount: int):
	stats.cur_health -= amount

func _on_teleport_timer_timeout() -> void:
	teleport_on_cooldown = false

func _ready() -> void:
	game_manager._set_player_position(self.global_position)

func _process(_delta: float) -> void:
	if stats.cur_health <= 0:
		self.queue_free()
	
	#broadcasts position to game manager for enemy pathfinding
	game_manager._set_player_position(self.global_position)
	#checks if the player presses the teleport button while the skill is available
	if Input.is_action_just_pressed("teleport") and not teleport_on_cooldown:
		self.global_position = get_global_mouse_position()
		teleport_on_cooldown = true
		teleport_timer.start()
		
	#TODO: disable sword hit box until attack is pressed and find way to do same on demon
	if Input.is_action_just_pressed("attack"):
		deal_damage()
	if (self.global_rotation > 2 or self.global_rotation < -2):
		skin.flip_v = true
	else:
		skin.flip_v = false

func _physics_process(_delta: float) -> void:
	#Detects move_left and move_right actions to calculate horizontal velocity
	var h_direction := Input.get_axis("move_left", "move_right")
	if h_direction:
		velocity.x = h_direction * stats.move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, stats.move_speed)
		
	#Detects move_up and move_down actions to calculate horizontal velocity	
	var v_direction := Input.get_axis("move_up", "move_down")
	if v_direction:
		velocity.y = v_direction * stats.move_speed
	else:
		velocity.y = move_toward(velocity.y, 0, stats.move_speed)

	move_and_slide()
