extends CharacterBody2D

@onready var teleport_timer: Timer = $TeleportTimer
const SPEED = 150.0
var teleport_on_cooldown = false

func _on_timer_timeout() -> void:
	teleport_on_cooldown = false

func _process(_delta: float) -> void:
	#checks if the player presses the teleport button while the skill is available
	if Input.is_action_just_pressed("teleport") and not teleport_on_cooldown:
		self.global_position = get_global_mouse_position()
		teleport_on_cooldown = true
		teleport_timer.start()

func _physics_process(_delta: float) -> void:
	#Detects move_left and move_right actions to calculate horizontal velocity
	var h_direction := Input.get_axis("move_left", "move_right")
	if h_direction:
		velocity.x = h_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#Detects move_up and move_down actions to calculate horizontal velocity	
	var v_direction := Input.get_axis("move_up", "move_down")
	if v_direction:
		velocity.y = v_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
