extends Node2D


const BULLET_SCENE = preload("res://scenes/bullet.tscn")


@onready var attack_point = $AttackPoint



func _process(delta: float) -> void:
	#blaster_sprite.rotation = get_local_mouse_position().angle()
	pass
	
func fire_bullet():
	var bullet = Utils.instantiate_scene_on_world(BULLET_SCENE, attack_point.global_position)
	bullet.rotation = attack_point.rotation
	bullet.update_velocity()
	

