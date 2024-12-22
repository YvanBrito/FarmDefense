extends Node2D

@onready var hearts_container: HBoxContainer = $"../InGameUI/heartsContainer"
@onready var player: CharacterBody2D = $"../Player"
@onready var pause_menu: CanvasLayer = $"../PauseMenu"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_menu.visible = not pause_menu.visible
		if pause_menu.visible: Engine.time_scale = 0
		else: Engine.time_scale = 1

func _ready() -> void:
	hearts_container.setMaxHearts(player.maxHealth/2)
	hearts_container.updateHearts(player.currentHealth)

func _process(_delta: float) -> void:
	pass
