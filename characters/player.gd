extends CharacterBody2D

@onready var animated_sprite = $demon

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 400
	move_and_slide()
	
# Play animations
	if direction.x < 0:
		animated_sprite.play("moving_left")
	elif direction.x > 0:
		animated_sprite.play("moving_right")
	elif direction.y < 0:
		animated_sprite.play("moving_left")
	elif direction.y > 0:
		animated_sprite.play("moving_right")
	else:
		animated_sprite.play("idle")

