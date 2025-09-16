extends Area2D

@onready var helleport_hitbox: CollisionShape2D = $HelleportHitbox
@onready var hit_timer: Timer = $HitTimer
@onready var stats: Node = %Stats

func toggle_hitbox():
	helleport_hitbox.disabled = not helleport_hitbox.disabled
	
func attack():
	toggle_hitbox()
	hit_timer.start()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_hit_timer_timeout() -> void:
	toggle_hitbox()
	hit_timer.stop()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		body.take_damage(stats.helleport_damage)
