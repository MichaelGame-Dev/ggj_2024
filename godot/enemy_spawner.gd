extends Marker2D
const ENEMY = preload("res://scenes/enemy.tscn")
@onready var spawn_timer = $SpawnTimer

func spawn_enemy():
	var enemy := ENEMY.instantiate()
	var world := get_tree().current_scene
	world.add_child(enemy)
	enemy.position
	var spawn_position : Vector2
	spawn_position.y = position.y
	spawn_position.x = randi_range(-100, 100)
	enemy.global_position = spawn_position


func _on_spawn_timer_timeout():
	spawn_enemy() 
