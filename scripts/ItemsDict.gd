extends Node

var Items: Dictionary = {
	"sword": {
		"name": "Sword",
		"description": "A small sword.",
		"quantity": 1,
		"texture_path": "res://assets/sprites/Cute_Fantasy/Icons/No Outline/Tool_Icons_NO_Outline_Separated/sword.png"
	},
	"axe": {
		"name": "Axe",
		"description": "A simple axe.\nYou can use to cut trees.",
		"quantity": 1,
		"texture_path": "res://assets/sprites/Cute_Fantasy/Icons/No Outline/Tool_Icons_NO_Outline_Separated/axe.png"
	},
}

func get_item(item_name: String) -> Dictionary:
	return Items.get(item_name)
