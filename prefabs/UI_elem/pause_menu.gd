extends CanvasLayer

@onready var slots_in_use_container: Control = $TextureRect/InUse
@onready var slots_backpack: Control = $TextureRect/Backpack
@onready var selection_gui: AnimatedSprite2D = $TextureRect/SelectionGUI

func _ready() -> void:
	InventorySingleton.updated_inventory.connect(update_pause_ui)
	update_pause_ui()

func _process(_delta: float) -> void:
	selection_gui.visible = true
	if InventorySingleton.index_selected_slot_pause_menu == -1:
		selection_gui.visible = false
	elif InventorySingleton.index_selected_slot_pause_menu < 5:
		selection_gui.global_position = slots_in_use_container.get_children()[InventorySingleton.index_selected_slot_pause_menu].global_position + Vector2(21,20)
	else:
		selection_gui.global_position = slots_backpack.get_children()[InventorySingleton.index_selected_slot_pause_menu-5].global_position + Vector2(21,20)

func update_pause_ui() -> void:
	for index_item in 5:
		slots_in_use_container.get_children()[index_item].item_details = InventorySingleton.backpack_itens[index_item]

	for index_item in range(5, len(InventorySingleton.backpack_itens)):
		slots_backpack.get_children()[index_item-5].item_details = InventorySingleton.backpack_itens[index_item]
