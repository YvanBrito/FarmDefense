extends CanvasLayer

@onready var items_slots_container: HBoxContainer = $ItemsSlots/ItemsSlotsContainer
@onready var selection_gui: AnimatedSprite2D = $ItemsSlots/ItemsSlotsContainer/SelectionGUI

func _ready() -> void:
	InventorySingleton.updated_inventory.connect(update_ui)
	InventorySingleton.add_item(Items.get_item("sword"))
	InventorySingleton.add_item(Items.get_item("axe"))
	InventorySingleton.add_item(Items.get_item("pickaxe"))
	InventorySingleton.add_item_on_pos(Items.get_item("sickle"), 6)

func _process(_delta: float) -> void:
	selection_gui.position = items_slots_container.get_children()[InventorySingleton.index_selected_slot_in_game+1].position + Vector2(21,20)

func update_ui() -> void:
	for index_item in 5:
		items_slots_container.get_children()[index_item+1].item_details = InventorySingleton.backpack_itens[index_item]
