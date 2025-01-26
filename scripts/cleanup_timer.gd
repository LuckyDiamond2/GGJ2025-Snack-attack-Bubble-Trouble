class_name CleanupTimer extends Timer

var node: Node

static func new_timer(node: Node):
	var timer = CleanupTimer.new()
	timer.setup()
	timer.node = node
	return timer

func setup():
	one_shot = true
	wait_time = 1.0
	connect("timeout", _on_timer_timeout)

func _on_timer_timeout() -> void:
	node.queue_free()
	queue_free()
