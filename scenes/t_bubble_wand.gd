extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("bubble wand loaded")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)
		#transform.x = int(event.position.x)
		#transform.y = int(event.position.y)
		set_position(event.position)
	
	elif event is InputEventMouseButton:
		print("shoot")
		
	
	
	# Print the size of the viewport.
	# print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
