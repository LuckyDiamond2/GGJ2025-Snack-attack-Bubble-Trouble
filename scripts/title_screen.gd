extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().change_scene_to_packed(load("res://scenes/game_screen.tscn")) ## funktioniert noch nicht


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
