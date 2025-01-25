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
