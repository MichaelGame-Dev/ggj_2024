extends CharacterBody2D
class_name Player
const TIGER_ZAP = preload("res://sfx/Tiger_zap.ogg")
const SPEED = 100.0
const VERTICAL_SPEED = -100.0
#const JUMP_VELOCITY = 4.5
@export var player_health : int = 3 
@onready var player_attack = $PlayerAttack
@onready var hurtbox_collision = $Hurtbox/HurtboxCollision
@onready var animation_player = $AnimationPlayer


@onready var collision_timer = $CollisionTimer
@onready var sprite_2d = $Sprite2D
#@onready var collision_shape_2d = $CollisionShape2D
@onready var hurtbox = $Hurtbox
@onready var attack_timer = $AttackTimer



# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	if !Globals.player:
		Globals.player = self
	animation_player.play("walking")


func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#var direction : vector2 = (input_dir.x, 0)
	#if direction:
		#velocity.x = direction.x * SPEED
		##velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		##velocity.z = move_toward(velocity.z, 0, SPEED)
		
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		velocity.y = VERTICAL_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#var collision = get_last_slide_collision()
	#if collision:
		#print(collision)
		#print(collision.get_collider())
		#collision_timer.start()
		#collision_shape_2d.disabled = true
		#player_health -= 1
		#if player_health <= 0:
			#print("game over")


func _on_collision_timer_timeout():
	pass
#	hurtbox_collision.disabled = false  # Replace with function body.


func _on_hurtbox_hurt(hitbox, damage):
		collision_timer.start()
		print("damage taken!")
		#hurtbox_collision.disabled = true
		player_health -= 1
		if player_health <= 0:
			print("game over")
		hurtbox.is_invincible = true
		#blinking_animation_player.play("take_hit")
		#await blinking_animation_player.animation_finished
		hurtbox.is_invincible = false


func _on_attack_timer_timeout():
	attack_timer.start()
	player_attack.fire_bullet() # Replace with function body.
	SoundManager.play_sound(TIGER_ZAP)
