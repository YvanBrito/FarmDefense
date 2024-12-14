extends Panel

@onready var sprite_2d: Sprite2D = $Sprite2D

func update(frame: int) -> void:
	sprite_2d.frame = frame
