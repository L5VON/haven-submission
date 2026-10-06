extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -450.0
const GRAVITY = 1200.0

@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):

	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction = Input.get_axis("move_left", "move_right")

	velocity.x = direction * SPEED

	# Direction
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false

	# Animation
	if not is_on_floor():
		animated_sprite_2d.play("jump")
	elif direction != 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")

	move_and_slide()
