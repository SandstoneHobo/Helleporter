extends Area2D

@onready var hitbox: CollisionShape2D = $Hitbox
@onready var sprite_2d: Sprite2D = $Hitbox/Sprite2D
@onready var stats: Node = %Stats
@onready var attack_timer: Timer = $AttackTimer
@onready var cooldown_timer: Timer = $CooldownTimer

var attack_on_cooldown = false

func toggle_hitbox():
	hitbox.disabled = not hitbox.disabled
	sprite_2d.visible = not sprite_2d.visible

#funcion damages all enemies in sword hitbox
func attack():
	toggle_hitbox()
	attack_on_cooldown = true
	attack_timer.start()
	cooldown_timer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	hitbox.look_at(get_global_mouse_position())
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		body.take_damage(stats.attack_damage)


func _on_attack_timer_timeout() -> void:
	toggle_hitbox()
	attack_timer.stop()


func _on_cooldown_timer_timeout() -> void:
	attack_on_cooldown = false
