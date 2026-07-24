extends Area2D


func _physics_process(_delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
	pass


func shoot():
	const BULLET = preload("uid://b5ixw66oaedki")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = $WeaponPivot/Pistol/ShootingPoint.global_position
	new_bullet.global_rotation = $WeaponPivot/Pistol/ShootingPoint.global_rotation
	$WeaponPivot/Pistol/ShootingPoint.add_child(new_bullet)
	pass

func _on_timer_timeout() -> void:
	shoot()
	pass
