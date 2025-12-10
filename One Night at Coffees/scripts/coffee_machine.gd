extends Area2D

var filled = false #var to check is the cup is filled, so we can add the milk and cant fill it twice
var pressed = false #var to check is the machine is running, so we dont start it twice
@onready var coffeemachinetimer = $coffeemachinetimer
@onready var coffee_cup = get_parent().get_node("coffee_cup")

func _on_button_pressed() -> void:
	if pressed == false:
		if coffee_cup.cup_on_plate: #we can only fill the cup is it is on the plate
			pressed = true
			coffeemachinetimer.start()
		


func _on_coffeemachinetimer_timeout() -> void:
	%cup_sprite._add_coffee()
	pressed = false
