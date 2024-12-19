extends Control

const ABOVE_MOUSE = Vector2(10, -100)
const UNDER_MOUSE = Vector2(10, 15)

var item_details: Dictionary : set = _set_item_details, get = _get_item_details
var description_pos: Vector2 = UNDER_MOUSE

@onready var item_sprite: Sprite2D = $ItemSprite
@onready var color_rect: ColorRect = $ColorRect
@onready var item_name: Label = $ColorRect/ItemName
@onready var item_description: Label = $ColorRect/ItemDescription
@onready var visible_on_screen_notifier_down: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifierDown
@onready var visible_on_screen_notifier_up: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifierUp

func _set_item_details(_item_details: Dictionary) -> void:
	item_details = _item_details
	item_name.text = item_details.get("name")
	item_description.text = item_details.get("description")
	item_sprite.texture = load(item_details.get("texture_path"))

func _get_item_details() -> Dictionary:
	return item_details

func _ready() -> void:
	color_rect.visible = false

func _process(_delta: float) -> void:
	description_pos = UNDER_MOUSE
	if visible_on_screen_notifier_up.is_on_screen() and not visible_on_screen_notifier_down.is_on_screen():
		description_pos = ABOVE_MOUSE
		
	if color_rect.visible:
		color_rect.position = get_local_mouse_position() + description_pos

func _on_mouse_entered() -> void:
	color_rect.visible = true

func _on_mouse_exited() -> void:
	color_rect.visible = false
