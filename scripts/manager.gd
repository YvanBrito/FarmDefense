extends Node2D

@onready var hearts_container: HBoxContainer = $"../InGameUI/heartsContainer"
@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:
	hearts_container.setMaxHearts(player.maxHealth/2)
	hearts_container.updateHearts(player.currentHealth)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
