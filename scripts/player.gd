extends CharacterBody2D

const SPEED = 200.0

var last_direction: Vector2

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	process_inputs()
	process_anims()

	move_and_slide()

func process_inputs() -> void:
	var horizontal_dir := Input.get_axis("ui_left", "ui_right")
	var vertical_dir := Input.get_axis("ui_up", "ui_down")
	
	velocity = Vector2(horizontal_dir, vertical_dir).normalized() * SPEED

func process_anims() -> void:
	if velocity != Vector2.ZERO:
		last_direction = velocity
		if velocity.y > 0:
			animated_sprite_2d.play("running_down")
		elif velocity.y < 0:
			animated_sprite_2d.play("running_up")
		elif velocity.x != 0:
			animated_sprite_2d.play("running_hor")
			animated_sprite_2d.flip_h = velocity.x < 0
	else:
		if last_direction.y > 0:
			animated_sprite_2d.play("idle_down")
		elif last_direction.y < 0:
			animated_sprite_2d.play("idle_up")
		elif last_direction.x != 0:
			animated_sprite_2d.flip_h = last_direction.x < 0
			animated_sprite_2d.play("idle_hor")
