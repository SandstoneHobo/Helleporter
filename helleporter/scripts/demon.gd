extends CharacterBody2D

var max_health := 10
var cur_health := 10
var move_speed = 1
var attack_damage = 1

var player_position = Vector2(0,0)
var attack_on_cooldown = false

@onready var attack_cooldown: Timer = $AttackCooldown
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hit_timer: Timer = $HitTimer

func _on_attack_cooldown_timeout() -> void:
	attack_on_cooldown = false
	attack_cooldown.stop()

func attack():
	var collider = ray_cast.get_collider()
	if ray_cast.is_colliding() and collider:
		if collider.is_in_group("Player") and not attack_on_cooldown:
			collider.take_damage(attack_damage)
			attack_on_cooldown = true
			attack_cooldown.start()

func take_damage(damage: int):
	sprite_2d.apply_scale(Vector2(2, 2))
	hit_timer.start()
	cur_health -= damage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cur_health <= 0:
		self.queue_free()
		GameManager.add_experience(1)
	player_position = GameManager.get_player_position()
	ray_cast.look_at(player_position)
	attack()
	
func _physics_process(delta: float) -> void:
	var x_delta = self.global_position.x - player_position.x
	var y_delta = self.global_position.y - player_position.y
	
	if abs(x_delta) > 5:
		velocity.x = x_delta * move_speed * -1
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		
	if abs(y_delta) > 5:
		velocity.y = y_delta * move_speed * -1
	else:
		velocity.y = move_toward(velocity.y, 0, move_speed)

	move_and_slide()


func _on_hit_timer_timeout() -> void:
	sprite_2d.apply_scale(Vector2(0.5, 0.5))
	hit_timer.stop()
