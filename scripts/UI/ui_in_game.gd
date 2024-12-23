extends CanvasLayer

@onready var items_slots_container: HBoxContainer = $ItemsSlots/ItemsSlotsContainer

func _ready() -> void:
	InventorySingleton.updated_inventory.connect(update_ui)
	InventorySingleton.add_item(Items.get_item("sword"), false)
	InventorySingleton.add_item(Items.get_item("axe"))
	InventorySingleton.add_item(Items.get_item("pickaxe"))
	InventorySingleton.add_item(Items.get_item("sickle"))

func _process(_delta: float) -> void:
	pass

func update_ui() -> void:
	for slot in items_slots_container.get_children():
		slot.item_details = InventorySingleton.in_use_itens[slot.get_index()]
