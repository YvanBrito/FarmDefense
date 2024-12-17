extends Node

var stored_itens: Array[Node2D] = []
var selected_itens: Array[Node2D] = []
var player: CharacterBody2D = null
const FoodSpritesEnum = preload("res://scripts/FoodSpritesEnum.gd")

signal updated_inventory

func _ready() -> void:
	print(FoodSpritesEnum.FoodsSprites)
	selected_itens

func add_item(item: Node2D) -> void:
	updated_inventory.emit()

func remove_item(item: Node2D) -> void:
	updated_inventory.emit()
