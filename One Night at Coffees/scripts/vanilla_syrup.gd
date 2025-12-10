extends Area2D

var pressed = false
@onready var vanillatimer = $vanillatimer
@onready var coffee_cup = get_parent().get_node("coffee_cup")

var dragging = false
var offset = Vector2(0,0)
var vanilla_on_plate = false
var vanillatimer_running = false


func _process(delta):
	if dragging:
		position = get_global_mouse_position() - offset


func _on_coffee_plate_area_entered(area: Area2D) -> void:
	vanilla_on_plate = true


func _on_coffee_plate_area_exited(area: Area2D) -> void:
	vanilla_on_plate = false


func _on_vanillatimer_timeout() -> void:
	vanillatimer_running = false
	%cup_sprite._add_vanilla()


func _on_vanilla_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_vanilla_button_button_up() -> void:
	if coffee_cup.cup_on_plate and vanilla_on_plate and not vanillatimer_running:
		vanillatimer_running = true
		vanillatimer.start()
	dragging = false
	position = Vector2(73, 325)
