extends Node

signal change_bgm_volume(value: float)
signal change_effect_volume(value: float)
var bgm_volume: float = 0.5
var effect_volume: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_bgm_volume.connect(_on_change_bgm_volume)
	change_effect_volume.connect(_on_change_effect_volume)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_change_bgm_volume(value: float):
	bgm_volume = value
	#print("bgm_volume: ", value)

func _on_change_effect_volume(value: float):
	effect_volume = value
	#print("effect_volume: ", value)

func get_bgm_volume() -> float:
	return bgm_volume

func get_effect_volume() -> float:
	return effect_volume
