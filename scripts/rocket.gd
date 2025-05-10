extends Area2D

@export var speed = 500
@onready var visible_notifier = $VisibileNotifier

func _ready():
	visible_notifier.connect("screen_exited", _on_visibile_notifier_screen_exited)

func _physics_process(delta: float) -> void:
	global_position.x += speed * delta

func _on_visibile_notifier_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.die()
