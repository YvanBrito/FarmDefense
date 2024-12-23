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
		"description": "A simple axe. You can use to cut trees.",
		"quantity": 1,
		"texture_path": "res://assets/sprites/Cute_Fantasy/Icons/No Outline/Tool_Icons_NO_Outline_Separated/axe.png"
	},
	"pickaxe": {
		"name": "Pickaxe",
		"description": "A simple pickaxe. You can use to break stones.",
		"quantity": 1,
		"texture_path": "res://assets/sprites/Cute_Fantasy/Icons/No Outline/Tool_Icons_NO_Outline_Separated/pickaxe.png"
	},
	"sickle": {
		"name": "Sickle",
		"description": "A simple sickle. You can use to cut grass.",
		"quantity": 1,
		"texture_path": "res://assets/sprites/Cute_Fantasy/Icons/No Outline/Tool_Icons_NO_Outline_Separated/sickle.png"
	},
}

func get_item(item_name: String) -> Dictionary:
	return Items.get(item_name)
