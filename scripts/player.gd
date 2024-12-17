extends CharacterBody2D

const SPEED: float = 100.0

var last_direction: Vector2 = Vector2.DOWN
var maxHealth: int = 6
var currentHealth: int = 6: set = _set_current_health, get = _get_current_health
var isAttacking: bool = false

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sword_animated_sprite: AnimatedSprite2D = $SwordAnimatedSprite

func _set_current_health(new_value: int) -> void:
	if new_value > maxHealth:
		currentHealth = maxHealth
	else:
		currentHealth = new_value

func _get_current_health() -> int:
	return currentHealth

func _ready() -> void:
	InventorySingleton.player = self

func _process(_delta: float) -> void:
	process_inputs()
	process_anims()
	
func _physics_process(_delta: float) -> void:
	move_and_slide()

func process_inputs() -> void:
	var horizontal_dir := Input.get_axis("ui_left", "ui_right")
	var vertical_dir := Input.get_axis("ui_up", "ui_down")
	
	if Input.is_action_pressed("action_tool"):
		isAttacking = true
	
	if isAttacking:
		velocity = Vector2.ZERO
	else:
		velocity = Vector2(horizontal_dir, vertical_dir).normalized() * SPEED

func process_anims() -> void:
	if isAttacking:
		sword_animated_sprite.visible = true
		#last_direction = get_local_mouse_position()
		#print(last_direction)
		if last_direction.y > 0:
			sword_animated_sprite.position = Vector2(0, -4)
			animated_sprite_2d.play("attack1_down")
			sword_animated_sprite.play("attack1_down")
		elif last_direction.y < 0:
			sword_animated_sprite.position = Vector2(0, -8)
			animated_sprite_2d.play("attack1_up")
			sword_animated_sprite.play("attack1_up")
		elif last_direction.x != 0:
			sword_animated_sprite.position = Vector2(0, -8)
			animated_sprite_2d.flip_h = last_direction.x < 0
			animated_sprite_2d.play("attack1_hor")
			sword_animated_sprite.play("attack1_hor")
	elif velocity != Vector2.ZERO:
		last_direction = velocity
		if abs(velocity.y) > abs(velocity.x):
			if velocity.y > 0:
				animated_sprite_2d.play("running_down")
			elif velocity.y < 0:
				animated_sprite_2d.play("running_up")
		elif velocity.x != 0:
			animated_sprite_2d.play("running_hor")
			animated_sprite_2d.flip_h = velocity.x < 0
			sword_animated_sprite.flip_h = velocity.x < 0
	else:
		if last_direction.y > 0:
			animated_sprite_2d.play("idle_down")
		elif last_direction.y < 0:
			animated_sprite_2d.play("idle_up")
		elif last_direction.x != 0:
			animated_sprite_2d.flip_h = last_direction.x < 0
			animated_sprite_2d.play("idle_hor")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation.begins_with("attack"):
		sword_animated_sprite.visible = false
		isAttacking = false
