extends Area2D

#This script implements drag and drop for the coffe cup.

@onready var coffee_plate = get_parent().get_node("coffee_plate")

var dragging = false
var offset = Vector2(0,0)
var cup_on_plate = false
var allow_movement = true

func _process(delta):
	if dragging and allow_movement:
		position = get_global_mouse_position() - offset

func _on_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
	if cup_on_plate:
		position = coffee_plate.plate_position - Vector2(50,70)
		allow_movement = false

#Using an Area2D, this script checks whether the cup is near the plate, so we can place it on the plate.

func _on_coffee_plate_area_entered(area: Area2D) -> void:
	cup_on_plate = true


func _delete() -> void:
	dragging = false
	offset = Vector2(0,0)
	cup_on_plate = false
	allow_movement = true
	position = Vector2(142,452)
