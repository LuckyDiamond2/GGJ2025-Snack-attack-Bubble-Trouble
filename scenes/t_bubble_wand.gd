extends Sprite2D

var cleanupTimer: BubbleCleanupTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("bubble wand loaded")
	
	cleanupTimer = get_parent().get_node("BubbleCleanupTimer")
	assert(cleanupTimer != null)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		#transform.x = int(event.position.x)
		#transform.y = int(event.position.y)
		set_position(event.position)
	
	elif event is InputEventMouseButton:
		var bubble = Sprite2D.new()
		bubble.offset = Vector2(-512, -512)
		bubble.position = event.position
		bubble.texture = load("res://assets/bubble/T_Bubble2.png")
		add_child(bubble)
		
		cleanupTimer.add_cleanup_timer(bubble)
	
	
	# Print the size of the viewport.
	# print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
