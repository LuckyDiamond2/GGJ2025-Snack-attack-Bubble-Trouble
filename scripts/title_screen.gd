extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BGMVolume/HSlider.value = $"/root/Settings".get_bgm_volume()
	$EffectVolume/HSlider.value = $"/root/Settings".get_effect_volume()
	pass #get_tree().change_scene_to_file("res://scenes/game_screen.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_screen.tscn")
	print("pressed 'Play'")

func _on_bmg_slider_value_changed(value: float) -> void:
	$"/root/Settings".change_bgm_volume.emit(value)


func _on_effect_slider_value_changed(value: float) -> void:
	$"/root/Settings".change_effect_volume.emit(value)
