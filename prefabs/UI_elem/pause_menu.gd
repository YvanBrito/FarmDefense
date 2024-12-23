extends CanvasLayer

@onready var slots_in_use_container: Control = $TextureRect/InUse
@onready var slots_backpack: Control = $TextureRect/Backpack

func _ready() -> void:
	InventorySingleton.updated_inventory.connect(update_pause_ui)
	update_pause_ui()

func update_pause_ui() -> void:
	for slot in slots_in_use_container.get_children():
		slot.item_details = InventorySingleton.in_use_itens[slot.get_index()]
	
	for slot in slots_backpack.get_children():
		slot.item_details = InventorySingleton.backpack_itens[slot.get_index()]
