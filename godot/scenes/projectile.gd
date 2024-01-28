class_name Projectile
extends Node2D

#const EXPLOSION_EFFECT_SCENE := preload("res://effects/explosion_effect.tscn")

@export var speed := 250.0

var velocity = Vector2.ZERO

func update_velocity() -> void:
	velocity.x = speed
	velocity = velocity.rotated(rotation)
	
func _ready() -> void:
	pass
#	Sound.play(Sound.bullet, randf_range(0.6, 1.2))

func _process(delta: float) -> void:
	position += velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() 


func _on_hit_box_body_entered(body: Node2D) -> void:
#	Utils.instantiate_scene_on_world(EXPLOSION_EFFECT_SCENE, global_position)
	queue_free()



func _on_hit_box_area_entered(area: Area2D) -> void:
#	Utils.instantiate_scene_on_world(EXPLOSION_EFFECT_SCENE, global_position)
	queue_free() # Replace with function body.
