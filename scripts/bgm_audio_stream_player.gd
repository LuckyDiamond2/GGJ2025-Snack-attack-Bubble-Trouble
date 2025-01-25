extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	volume_db = linear_to_db($"/root/Settings".get_bgm_volume())
	$"/root/Settings".change_bgm_volume.connect(_on_volume_change)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_volume_change(value: float):
	volume_db = linear_to_db($"/root/Settings".get_bgm_volume())
