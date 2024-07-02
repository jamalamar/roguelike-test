extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/player")
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if health > 0:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 100.0
		move_and_slide()
	else:
		velocity = Vector2.ZERO
		move_and_slide()

func take_damage():
	health -= 1
	animated_sprite.play("damage")  # Play damage animation

	if health <= 0:
		die()

func die() -> void:
	animated_sprite.play("die")  # Play die animation
	velocity = Vector2.ZERO  # Stop movement
	await get_tree().create_timer(1.0).timeout  # Wait for the die animation to finish
	queue_free()

func is_alive() -> bool:
	return health > 0
