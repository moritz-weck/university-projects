extends Area2D

var pressed = false
@onready var chocolatetimer = $chocolatetimer
@onready var coffee_cup = get_parent().get_node("coffee_cup")

var dragging = false
var offset = Vector2(0,0)
var chocolate_on_plate = false
var chocolatetimer_running = false


func _process(delta):
	if dragging:
		position = get_global_mouse_position() - offset


func _on_timer_timeout() -> void:
	chocolatetimer_running = false
	%cup_sprite._add_chocolate()


func _on_chocolate_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_chocolate_button_button_up() -> void:
	if coffee_cup.cup_on_plate and chocolate_on_plate and not chocolatetimer_running:
		chocolatetimer_running = true
		chocolatetimer.start()
	dragging = false
	position = Vector2(318, 331)


func _on_coffee_plate_area_entered(area: Area2D) -> void:
	chocolate_on_plate = true


func _on_coffee_plate_area_exited(area: Area2D) -> void:
	chocolate_on_plate = false
