class_name Slot extends Control

const ABOVE_MOUSE = Vector2(10, -100)
const UNDER_MOUSE = Vector2(10, 15)

var item_details: Dictionary : set = _set_item_details, get = _get_item_details
var description_pos: Vector2 = UNDER_MOUSE
@export_enum("NotWearable", "Wearable") var slot_type := "NotWearable"
@export var slot_index: int = 0

@onready var item_sprite: TextureRect = $TextureRect
@onready var color_rect: ColorRect = $ColorRect
@onready var item_name: Label = $ColorRect/ItemName
@onready var item_description: Label = $ColorRect/ItemDescription
@onready var visible_on_screen_notifier_down: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifierDown
@onready var visible_on_screen_notifier_up: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifierUp

func _set_item_details(_item_details: Dictionary) -> void:
	item_details = _item_details
	if _item_details:
		item_name.text = item_details.get("name")
		item_description.text = item_details.get("description")
		item_sprite.texture = load(item_details.get("texture_path"))
	else:
		item_name.text = ""
		item_description.text = ""
		item_sprite.texture = null

func _get_item_details() -> Dictionary:
	return item_details

func _ready() -> void:
	color_rect.visible = false

func _process(_delta: float) -> void:
	description_pos = UNDER_MOUSE
	if visible_on_screen_notifier_up.is_on_screen() and not visible_on_screen_notifier_down.is_on_screen():
		description_pos = ABOVE_MOUSE

func _physics_process(_delta: float) -> void:
	if color_rect.visible:
		color_rect.position = get_local_mouse_position() + description_pos

func _on_mouse_entered() -> void:
	if item_details.get("description") and item_details.get("description") != "":
		color_rect.visible = true

func _on_mouse_exited() -> void:
	color_rect.visible = false

func _get_drag_data(_at_position:Vector2)->Variant:
	var preview_texture := TextureRect.new()
	
	preview_texture.texture = item_sprite.texture
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.size = Vector2(49, 49)
	
	var preview := Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	
	return self

func _can_drop_data(_at_position:Vector2, data:Variant)->bool:
	return data is Slot

func _drop_data(_at_position:Vector2, data:Variant)->void:
	if item_details == {}:
		item_details = data.item_details
		InventorySingleton.backpack_itens[slot_index] = InventorySingleton.backpack_itens[data.slot_index]
		data.set_data_empty()
	else:
		var temp := item_details
		item_details = data.item_details
		InventorySingleton.backpack_itens[slot_index] = InventorySingleton.backpack_itens[data.slot_index]
		data.item_details = temp
		InventorySingleton.backpack_itens[data.slot_index] = temp
	
	InventorySingleton.updated_inventory.emit()

func set_data_empty() -> void:
	item_details = {}
	InventorySingleton.backpack_itens[slot_index] = {}
