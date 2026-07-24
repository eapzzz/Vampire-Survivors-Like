extends Node2D

const MOB = preload("uid://y38gte5o0xf8")


func spawn_mob():
	var new_mob = MOB.instantiate()
	$Player/Path2D/PathFollow2D.progress_ratio = randf()
	new_mob.global_position = $Player/Path2D/PathFollow2D.global_position
	add_child(new_mob)
	pass


func _on_timer_timeout() -> void:
	spawn_mob()	
	pass
