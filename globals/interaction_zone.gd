extends Area2D

@export var outlined_sprite : Sprite2D

signal has_been_clicked
signal mouse_on
signal mouse_off

func _ready() -> void:
	outlined_sprite.visible = false

func _on_mouse_entered() -> void:
	outlined_sprite.visible = true
	mouse_on.emit(outlined_sprite)


func _on_mouse_exited() -> void:
	outlined_sprite.visible = false
	mouse_off.emit(outlined_sprite)


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		has_been_clicked.emit(outlined_sprite)
