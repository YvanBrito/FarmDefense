extends Node

var backpack_itens: Array[Dictionary] = []
var in_use_itens: Array[Dictionary] = []
var player: CharacterBody2D = null

signal updated_inventory

func _ready() -> void:
	backpack_itens.resize(25)
	in_use_itens.resize(5)

func add_item_on_pos(_item: Dictionary, pos: int, inBackpack: bool = true) -> void:
	if inBackpack: backpack_itens[pos] = _item
	else: in_use_itens[pos] = _item
	updated_inventory.emit()

func add_item(_item: Dictionary, inBackpack: bool = true) -> void:
	if inBackpack:
		backpack_itens[backpack_itens.find({})] = _item
	else:
		in_use_itens[in_use_itens.find({})] = _item
	updated_inventory.emit()

func remove_item(pos: int, inBackpack: bool = true) -> void:
	if inBackpack: backpack_itens[pos] = {}
	else: in_use_itens[pos] = {}
	updated_inventory.emit()
