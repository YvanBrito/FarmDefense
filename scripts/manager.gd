extends Node2D

@onready var hearts_container: HBoxContainer = $"../InGameUI/heartsContainer"
@onready var player: CharacterBody2D = $"../Player"
@onready var pause_menu: CanvasLayer = $"../PauseMenu"
@onready var in_game_ui: CanvasLayer = $"../InGameUI"
@onready var ground: TileMapLayer = $"../TileMapLayer/Ground"
@onready var tile_selector: TextureRect = $"../TileSelector"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_menu.visible = not pause_menu.visible
		in_game_ui.visible = not in_game_ui.visible
		if pause_menu.visible: Engine.time_scale = 0
		else: Engine.time_scale = 1

func _ready() -> void:
	hearts_container.setMaxHearts(player.maxHealth/2)
	hearts_container.updateHearts(player.currentHealth)

func _process(_delta: float) -> void:
	change_selector_tile()
	pass

func change_selector_tile() -> void:
	var mousePos: Vector2 = ground.get_local_mouse_position()
	var loc: Vector2 = ground.local_to_map(mousePos)
	tile_selector.position = ground.map_to_local(loc) - Vector2(8, 8)
