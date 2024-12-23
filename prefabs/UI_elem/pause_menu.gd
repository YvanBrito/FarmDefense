extends CanvasLayer

@onready var slots_in_use_container: Control = $TextureRect/InUse
@onready var slots_backpack: Control = $TextureRect/Backpack

func _ready() -> void:
	InventorySingleton.updated_inventory.connect(update_pause_ui)
	update_pause_ui()

func update_pause_ui() -> void:
	for index_item in 5:
		slots_in_use_container.get_children()[index_item].item_details = InventorySingleton.backpack_itens[index_item]

	for index_item in range(5, len(InventorySingleton.backpack_itens)):
		slots_backpack.get_children()[index_item-5].item_details = InventorySingleton.backpack_itens[index_item]
