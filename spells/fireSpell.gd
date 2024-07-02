extends Area2D

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0.0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shoot():
	const FIREATTACK = preload("res://spells/fireattack.tscn")
	var new_fireattack = FIREATTACK.instantiate()
	new_fireattack.global_position = $fireSpell/ShootingPoint.global_position
	new_fireattack.global_rotation = $fireSpell/ShootingPoint.global_rotation
	$fireSpell/ShootingPoint.add_child(new_fireattack)


func _on_timer_timeout():
	shoot()
	
func get_target_enemy(enemies_in_range: Array) -> Node:
	for enemy in enemies_in_range:
		if enemy.is_alive():
			return enemy
	return null
