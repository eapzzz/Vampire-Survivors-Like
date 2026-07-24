extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")

var speed = 300.0
var health = 3


func _ready() -> void:
	$Slime.play_walk()
	pass


func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	pass


func take_damage():
	health -= 1
	$Slime.play_hurt()
	if health == 0:
		queue_free()
		const SMOKE_EXPLOSION = preload("uid://dhmhmrth6rdce")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
	pass
