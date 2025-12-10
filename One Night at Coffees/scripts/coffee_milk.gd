extends Area2D

var pressed = false
@onready var milktimer = $milktimer
@onready var coffee_cup = get_parent().get_node("coffee_cup")

var dragging = false
var offset = Vector2(0,0)
var milk_on_plate = false
var milktimer_running = false


func _process(delta):
	if dragging:
		position = get_global_mouse_position() - offset


func _on_milktimer_timeout() -> void:
	milktimer_running = false
	%cup_sprite._add_milk()


func _on_milk_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_milk_button_button_up() -> void:
	if coffee_cup.cup_on_plate and milk_on_plate and not milktimer_running:
		milktimer_running = true
		milktimer.start()
	dragging = false
	position = Vector2(922, 308)


func _on_area_entered(area: Area2D) -> void:
	milk_on_plate = true


func _on_area_exited(area: Area2D) -> void:
	milk_on_plate = false
