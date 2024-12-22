extends CanvasLayer

@onready var items_slots_container: HBoxContainer = $TextureRect/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InventorySingleton.updated_inventory.connect(update_pause_ui)
	update_pause_ui()

func update_pause_ui() -> void:
	print("pause inventory")
	for n in items_slots_container.get_children():
		items_slots_container.remove_child(n)
		n.queue_free() 
	for item in InventorySingleton.selected_itens:
		var new_slot: PackedScene = preload("res://prefabs/UI_elem/slot_item.tscn")
		var slot: Control = new_slot.instantiate()
		items_slots_container.add_child(slot)
		slot.item_details = item
