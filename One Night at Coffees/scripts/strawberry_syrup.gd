extends Area2D

var pressed = false
@onready var strawberrytimer = $strawberrytimer
@onready var coffee_cup = get_parent().get_node("coffee_cup")

var dragging = false
var offset = Vector2(0,0)
var strawberry_on_plate = false
var strawberrytimer_running = false


func _process(delta):
	if dragging:
		position = get_global_mouse_position() - offset


func _on_coffee_plate_area_entered(area: Area2D) -> void:
	strawberry_on_plate = true


func _on_coffee_plate_area_exited(area: Area2D) -> void:
	strawberry_on_plate = false

func _on_strawberrytimer_timeout() -> void:
	strawberrytimer_running = false
	%cup_sprite._add_strawberry()

func _on_strawberry_button_button_down() -> void:
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_strawberry_button_button_up() -> void:
	if coffee_cup.cup_on_plate and strawberry_on_plate and not strawberrytimer_running:
		strawberrytimer_running = true
		strawberrytimer.start()
	dragging = false
	position = Vector2(201, 324)
