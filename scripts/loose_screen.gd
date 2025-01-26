extends Node

var cat_nye = [preload("res://assets/cats/Nyehehehe.mp3"),
			   preload("res://assets/cats/Neenerneener.mp3")]
			
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = AudioStreamPlayer.new()
	player.volume_db = linear_to_db($"/root/Settings".get_effect_volume()) + 25
	add_child(player)
	var rand_pitch_scale = randf_range(0.7, 1.3)
	player.pitch_scale = rand_pitch_scale
	player.stream = cat_nye.pick_random()
	player.play()


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
