extends CanvasLayer

@onready var items_slots_container: HBoxContainer = $ItemsSlots/ItemsSlotsContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InventorySingleton.updated_inventory.connect(update_ui)
	InventorySingleton.add_item(ItemsDict.get_items().get("sword"))
	InventorySingleton.add_item(ItemsDict.get_items().get("axe"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update_ui() -> void:
	for n in items_slots_container.get_children():
		items_slots_container.remove_child(n)
		n.queue_free() 
	for item in InventorySingleton.selected_itens:
		var new_slot: PackedScene = preload("res://prefabs/UI_elem/slot_item.tscn")
		var slot: Control = new_slot.instantiate()
		items_slots_container.add_child(slot)
		slot.item_details = item
