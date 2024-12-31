extends Node

var backpack_itens: Array[Dictionary] = []
var index_selected_slot_in_game: int = 2
var index_selected_slot_pause_menu: int = 6
var player: CharacterBody2D = null

signal updated_inventory

func _ready() -> void:
	backpack_itens.resize(30)

func add_item_on_pos(_item: Dictionary, pos: int) -> void:
	backpack_itens[pos] = _item
	updated_inventory.emit()

func add_item(_item: Dictionary) -> void:
	backpack_itens[backpack_itens.find({})] = _item
	updated_inventory.emit()

func remove_item(pos: int) -> void:
	backpack_itens[pos] = {}
	updated_inventory.emit()
