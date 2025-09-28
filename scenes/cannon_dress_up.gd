extends Node2D

### BUTTONS
@onready var hair_button: Button = $selector_buttons/outfit_selectors/hair_box/hair_button
@onready var flight_suit_down: Button = $selector_buttons/outfit_selectors/flight_suit_box/flight_suit_down
@onready var flight_suit_up: Button = $selector_buttons/outfit_selectors/flight_suit_box/flight_suit_up
@onready var helmet_button: Button = $selector_buttons/outfit_selectors/helmet_box/helmet_button
@onready var chest_plate_button: Button = $selector_buttons/outfit_selectors/chest_plate_box/chest_plate_button
@onready var shawl_button: Button = $selector_buttons/outfit_selectors/shawl_box/shawl_button
@onready var kama_button: Button = $selector_buttons/outfit_selectors/kama_box/kama_button
@onready var belt_button: Button = $selector_buttons/outfit_selectors/belt_box/belt_button


### SPRITES
@onready var hair: Sprite2D = $kurshal/hair
@onready var flight_suit: Sprite2D = $kurshal/flight_suit
@onready var helmet: Sprite2D = $kurshal/helmet
@onready var chest_plate: Sprite2D = $kurshal/chest_plate
@onready var shawl_under: Sprite2D = $kurshal/shawl_under
@onready var shawl_over: Sprite2D = $kurshal/shawl_up
@onready var kama_under: Sprite2D = $kurshal/kama_under
@onready var kama_over: Sprite2D = $kurshal/kama_over
@onready var belt: Sprite2D = $kurshal/belt


### TIDBITS
@onready var tid_bit_info_text: Label = $text_boxes/tid_bit_info_text
var tid_bit_collection = {
	"constant" = "~Fun Facts about Kurshal~\nPronouns: They/Them\nHeight: 5'8\" / 172 cm\nHover over different areas to learn more tidbits about them!",
	"scars" = "Kurshal had a bad fall off a faither as a child where they were run over by the faither behind theirs. It left them heavily scarred and cost them the ability to race in their youth.",
	"helmet" = "Kurshal's clan believes that their faces are never to be seen by any living thing. While they are no longer apart of this clan, they still hold this belief.",
	"hands" = "Kurshal doesn't often speak, they communicate mostly with hand signs and written messages on their data pad.",
	"jaw" = "The injury to their jaw still causes them pain today. They refrain from speaking but when they do, it is often soft and mumbled together due to the limited movement. Facial expressions tend to be limited on this side of the face too.",
	"cypress" = "Their weapon of choice is a modified Cycler rifle they call 'Cypress.'",
	"dent" = "They have a significant dent in their chest plate from when storm troopers and inquistors attacked the monastery they were living at. The dent is a reminder that they survived when no one else did.",
	"armor" = "All Kurshal has left of their original full kit of armor is their helmet and chest plate. Both pieces are heavily weathered and not made of true beskar since they are living during the time of the rise of the Empire... so both pieces have rust spots.",
	"name" = "They were raised as \"Kiran\" then was given the name \"Dar'soon Ra'cayer\" in their clan and mercenary work before finally settling into the name \"Kurshal.\"",
	"0" = ""
	}

###CONSTANTS
@onready var mouse_box: CollisionShape2D = $interaction_zones/mouse/mouse_box

var flight_suit_selected : int = 2
var flight_suit_options : int = 4


func _ready() -> void:
	if !Globals.game_started:
		$TextureRect/Timer.start(1.5)
	else:
		$TextureRect.visible = false
	$interaction_zones.visible = true

func _process(delta: float) -> void:
	#tracking mouse movement by putting a collision shape on it
	mouse_box.global_position = get_global_mouse_position()

# CLICKY BUTTONS ON/OFFS
#uses the toggle values to hide/show the items or move between the two simple animation frames
func _on_hair_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		hair_button.text = "Up"
		hair.frame = 0
	else:
		hair_button.text = "Down"
		hair.frame = 1

func _on_helmet_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		helmet_button.text = "On"
		helmet.visible = true
	else:
		helmet_button.text = "Off"
		helmet.visible = false

func _on_chest_plate_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		chest_plate_button.text = "On"
		chest_plate.visible = true
	else:
		chest_plate_button.text = "Off"
		chest_plate.visible = false

func _on_shawl_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		shawl_button.text = "On"
		shawl_over.visible = true
		shawl_under.visible = true
	else:
		shawl_button.text = "Off"
		shawl_over.visible = false
		shawl_under.visible = false

func _on_kama_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		kama_button.text = "On"
		kama_over.visible = true
		kama_under.visible = true
	else:
		kama_button.text = "Off"
		kama_over.visible = false
		kama_under.visible = false

func _on_belt_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		belt_button.text = "On"
		belt.visible = true
	else:
		belt_button.text = "Off"
		belt.visible = false


#THE ROTATING SELECTION ONES
#It will disable when it hits the minimum or maxium, otherwise it shifts the selected value up/down
#and then moves the frame to that value
func _on_flight_suit_down_pressed() -> void:
	flight_suit_selected -= 1
	flight_suit_up.disabled = false
	if flight_suit_selected == 0:
		flight_suit_down.disabled = true
	flight_suit.frame = flight_suit_selected

func _on_flight_suit_up_pressed() -> void:
	flight_suit_selected += 1
	flight_suit_down.disabled = false
	if flight_suit_selected == flight_suit_options:
		flight_suit_up.disabled = true
	flight_suit.frame = flight_suit_selected


## TIDBITS HOVER TEXT
# when the mouse collision shape enters one of these spaces, the hover text populates
func _on_scars_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["scars"]

func _on_jaw_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["jaw"]

func _on_helmet_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["helmet"]

func _on_hands_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["hands"]

func _on_cypress_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["cypress"]

func _on_name_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["name"]

func _on_dent_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["dent"]

func _on_armor_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["armor"]

func _on_away_space_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["constant"]


#splash screen
func _on_timer_timeout() -> void:
	$TextureRect/AnimationPlayer.play("fade_out")
	Globals.game_started = true

#swap scenes
func _on_button_pressed() -> void:
	TransitionFade.transition()
	await TransitionFade.transition_finished
	get_tree().change_scene_to_file("res://scenes/western_dress_up.tscn")
