extends Node2D

### BUTTONS
@onready var hat_button: Button = $selector_buttons/outfit_selectors/hat_box/hat_button
@onready var hair_button: Button = $selector_buttons/outfit_selectors/hair_box/hair_button
@onready var mask_button: Button = $selector_buttons/outfit_selectors/mask_box/mask_button
@onready var chaps_button: Button = $selector_buttons/outfit_selectors/chaps_box/chaps_button
@onready var gloves_button: Button = $selector_buttons/outfit_selectors/gloves_box/gloves_button
@onready var shirt_down: Button = $selector_buttons/outfit_selectors/shirt_box/shirt_down
@onready var shirt_up: Button = $selector_buttons/outfit_selectors/shirt_box/shirt_up
@onready var pants_down: Button = $selector_buttons/outfit_selectors/pants_box/pants_down
@onready var pants_up: Button = $selector_buttons/outfit_selectors/pants_box/pants_up

### SPRITES
@onready var pants: Sprite2D = $kurshal/pants
@onready var chaps: Sprite2D = $kurshal/chaps
@onready var gloves: Sprite2D = $kurshal/gloves
@onready var shirt: Sprite2D = $kurshal/shirt
@onready var mask: Sprite2D = $kurshal/mask
@onready var hat_under: Sprite2D = $kurshal/hat_under
@onready var hair: Sprite2D = $kurshal/hair
@onready var hat_over: Sprite2D = $kurshal/hat_over

### TIDBITS
@onready var tid_bit_info_text: Label = $text_boxes/tid_bit_info_text
var tid_bit_collection = {
	"constant" = "~Fun Facts about Kurshal~\nPronouns: They/Them\nHeight: 5'8\" / 172 cm\nHover over different areas to learn more tidbits about them!",
	"scars" = "Kurshal had a bad fall off a horse as a child where they were run over by the horses behind theirs. It left them heavily scarred and cost them their professional riding dreams.",
	"mask" = "They are self conscious of their scars, as well as don't want to be identified easily from it... so they are always wearing their mask up.",
	"hands" = "Since Kurshal doesn't often speak, they communicate mostly with ASL and written messages on an outdated iPod Touch notes app.",
	"jaw" = "The injury to their jaw still causes them pain today. They refrain from speaking but when they do, it is often soft and mumbled together due to the limited movement. Facial expressions tend to be limited on this side of the face too.",
	"cypress" = "Their weapon of choice is a modified Cycler rifle they call 'Cypress.'",
	"tan" = "Since they are always wearing their mask, they have developed the world's worst tan line.",
	"name" = "They were raised as \"Kiran\" then was given the name \"Dar'soon Ra'cayer\" as a mercenary before finally settling into the name \"Kurshal.\"",
	"0" = ""
	}

###CONSTANTS
@onready var mouse_box: CollisionShape2D = $interaction_zones/mouse/mouse_box

var shirt_selected : int = 0
var pants_selected : int = 0
var shirt_options : int = 6
var pants_options : int = 3


func _ready() -> void:
	$interaction_zones.visible = true

func _process(delta: float) -> void:
	#tracking mouse movement by putting a collision shape on it
	mouse_box.global_position = get_global_mouse_position()

# CLICKY BUTTONS ON/OFFS
#uses the toggle values to hide/show the items or move between the two simple animation frames
func _on_hat_button_toggled(toggled_on: bool) -> void:
	hat_over.visible = toggled_on
	hat_under.visible = toggled_on
	if toggled_on:
		hat_button.text = "On"
	else:
		hat_button.text = "Off"

func _on_hair_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		hair_button.text = "Up"
		hair.frame = 0
	else:
		hair_button.text = "Down"
		hair.frame = 1

func _on_mask_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		mask_button.text = "Up"
		mask.frame = 1
	else:
		mask_button.text = "Down"
		mask.frame = 0

func _on_chaps_button_toggled(toggled_on: bool) -> void:
	chaps.visible = toggled_on
	if toggled_on:
		chaps_button.text = "On"
	else:
		chaps_button.text = "Off"

func _on_gloves_button_toggled(toggled_on: bool) -> void:
	gloves.visible = toggled_on
	if toggled_on:
		gloves_button.text = "On"
	else:
		gloves_button.text = "Off"


#THE ROTATING SELECTION ONES
#It will disable when it hits the minimum or maxium, otherwise it shifts the selected value up/down
#and then moves the frame to that value
func _on_shirt_down_pressed() -> void:
	shirt_selected -= 1
	shirt_up.disabled = false
	if shirt_selected == 0:
		shirt_down.disabled = true
	shirt.frame = shirt_selected

func _on_shirt_up_pressed() -> void:
	shirt_selected += 1
	shirt_down.disabled = false
	if shirt_selected == shirt_options:
		shirt_up.disabled = true
	shirt.frame = shirt_selected


func _on_pants_down_pressed() -> void:
	pants_selected -= 1
	pants_up.disabled = false
	if pants_selected == 0:
		pants_down.disabled = true
	pants.frame = pants_selected

func _on_pants_up_pressed() -> void:
	pants_selected += 1
	pants_down.disabled = false
	if pants_selected == pants_options:
		pants_up.disabled = true
	pants.frame = pants_selected


## TIDBITS HOVER TEXT
# when the mouse collision shape enters one of these spaces, the hover text populates
func _on_scars_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["scars"]

func _on_jaw_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["jaw"]

func _on_mask_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["mask"]

func _on_hands_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["hands"]

func _on_tan_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["tan"]

func _on_cypress_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["cypress"]

func _on_name_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["name"]

func _on_away_space_area_entered(area: Area2D) -> void:
	tid_bit_info_text.text = tid_bit_collection["constant"]

#swap scenes
func _on_button_pressed() -> void:
	TransitionFade.transition()
	await TransitionFade.transition_finished
	get_tree().change_scene_to_file("res://scenes/cannon_dress_up.tscn")
