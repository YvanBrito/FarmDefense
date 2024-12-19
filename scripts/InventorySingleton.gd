extends Node

var stored_itens: Array[Dictionary] = []
var selected_itens: Array[Dictionary] = []
var player: CharacterBody2D = null

signal updated_inventory

func _ready() -> void:
	pass

func add_item(_item: Dictionary) -> void:
	selected_itens.append(_item)
	updated_inventory.emit()

func remove_item(_item: Node2D) -> void:
	updated_inventory.emit()
