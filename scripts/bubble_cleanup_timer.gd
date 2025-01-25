class_name BubbleCleanupTimer extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_cleanup_timer(node: Node):
	var timer = CleanupTimer.new_timer(node)
	node.add_child(timer)
	timer.start()

func _on_timer_timeout() -> void:
	pass
