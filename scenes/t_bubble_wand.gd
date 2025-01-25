extends Sprite2D

var cleanupTimer: BubbleCleanupTimer
var bubbles: Node
var lastBubbleFiredTime: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cleanupTimer = get_parent().get_node("BubbleCleanupTimer")
	assert(cleanupTimer != null)
	
	bubbles = get_parent().get_node("Bubbles")
	assert(bubbles != null)
	
	lastBubbleFiredTime = Time.get_ticks_msec()

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
		var now = Time.get_ticks_msec()
		if now - 200 < lastBubbleFiredTime:
			return

		var bubble = Bubble.new()
		bubbles.add_child(bubble)
		bubble.set_position(event.position)
		
		cleanupTimer.add_cleanup_timer(bubble)
		lastBubbleFiredTime = now
	
	# Print the size of the viewport.
	# print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
