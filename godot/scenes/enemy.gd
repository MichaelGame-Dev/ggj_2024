extends Node2D
@onready var animation_player = $AnimationPlayer

var health : int = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("walking")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 50 * delta
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_hurtbox_hurt(hitbox, damage):
	health -= damage
	if health <= 0:
		Globals.add_points.emit(10)
		queue_free()
