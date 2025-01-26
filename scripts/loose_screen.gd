extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# speech bubble button
func _on_play_again_button_pressed() -> void:
	playAgain()

# try again buton
func _on_t_try_again_button_pressed() -> void:
	playAgain()

func playAgain() -> void:
	get_tree().change_scene_to_file("res://scenes/game_screen.tscn")
	print("pressed 'Play Again' from loose screen")


# quit game button
func _on_quit_game_button_pressed() -> void:
	quitGame()

# quit game bubble button
func _on_quit_game_bubble_button_pressed() -> void:
	quitGame()
	
func quitGame() -> void:
	print("quit game from loose screen")
	get_tree().quit()


# menu bubble button
func _on_menu_bubble_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	print("pressed 'Menu' from loose screen")
