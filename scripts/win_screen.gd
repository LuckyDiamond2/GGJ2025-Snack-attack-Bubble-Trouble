extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_screen.tscn")
	print("pressed 'Play Again' from win screen")
