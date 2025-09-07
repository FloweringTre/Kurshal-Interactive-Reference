extends Node2D

@export var new_res_loc : String
@export var new_name : String
@export var left_arrow : bool 
@export var scene_key : String 


func _ready() -> void:
	$Label.text = ""
	$shadow.flip_h = left_arrow
	$arrow.flip_h = left_arrow

func _on_interaction_zone_has_been_clicked(clicked_outline) -> void:
	if clicked_outline == $shadow:
		Globals.scene = scene_key
		TransitionFade.transition()
		await TransitionFade.transition_finished
		get_tree().change_scene_to_file(new_res_loc)


func _on_interaction_zone_mouse_on(clicked_outline) -> void:
	if clicked_outline == $shadow:
		$Label.text = new_name


func _on_interaction_zone_mouse_off(clicked_outline) -> void:
	if clicked_outline == $shadow:
		$Label.text = ""
