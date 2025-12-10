extends Sprite2D

@onready var coffee_cup = get_parent()
@onready var error_sound = $error_sound

#different textures of the cup, higher level is less milk
var empty = load("res://assets/sprites/coffee_minigame/new_assets/cupempty.png")
var coffee0 = load("res://assets/sprites/coffee_minigame/new_assets/cupcoffee0.png")
var coffee1 = load("res://assets/sprites/coffee_minigame/new_assets/cupcoffee1.png")
var coffee2 = load("res://assets/sprites/coffee_minigame/new_assets/cupcoffee2.png")
var milk = load("res://assets/sprites/coffee_minigame/new_assets/cupmilk.png")
var strawberry = load("res://assets/sprites/coffee_minigame/new_assets/cupstrawberry.png")
var vanilla = load("res://assets/sprites/coffee_minigame/new_assets/cupvanilla.png")
var chocolate = load("res://assets/sprites/coffee_minigame/new_assets/cupchocolate.png")


func _ready() -> void:
	self.texture = empty
	Global_Values.milkpumps = 0
	Global_Values.added_coffee = false
	Global_Values.added_strawberry = false
	Global_Values.added_vanilla = false
	Global_Values.added_chocolate = false

func _add_coffee() -> void:
	if coffee_cup.cup_on_plate:
		if Global_Values.milkpumps == 0 and not Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_vanilla and not Global_Values.added_strawberry:
			self.texture = coffee0
			Global_Values.added_coffee = true
		elif Global_Values.milkpumps == 1 and not Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_vanilla and not Global_Values.added_strawberry:
			self.texture = coffee1
			Global_Values.added_coffee = true
		else:
			error_sound.play()
	else:
		error_sound.play()


func _add_milk() -> void:
#depending on the previous milk level, the colour of the cup changes
	if coffee_cup.cup_on_plate:
		if Global_Values.milkpumps == 0 and not Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_vanilla and not Global_Values.added_strawberry:
			self.texture = milk
			Global_Values.milkpumps = 1
		elif Global_Values.milkpumps == 0 and Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_vanilla and not Global_Values.added_strawberry:
			self.texture = coffee1
			Global_Values.milkpumps = 1
		elif Global_Values.milkpumps == 1 and Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_vanilla and not Global_Values.added_strawberry:
			self.texture = coffee2
			Global_Values.milkpumps = 2
		else:
			error_sound.play()
	else:
		error_sound.play()


func _add_chocolate() -> void:
	if coffee_cup.cup_on_plate:
		if Global_Values.milkpumps == 1 and not Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_vanilla and not Global_Values.added_strawberry:
			self.texture = chocolate
			Global_Values.added_chocolate = true
		else:
			error_sound.play()
	else:
		error_sound.play()

func _add_strawberry() -> void:
	if coffee_cup.cup_on_plate:
		if Global_Values.milkpumps == 1 and not Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_vanilla and not Global_Values.added_strawberry:
			self.texture = strawberry
			Global_Values.added_strawberry = true
		else:
			error_sound.play()
	else:
		error_sound.play()

func _add_vanilla() -> void:
	if coffee_cup.cup_on_plate:
		if Global_Values.milkpumps == 1 and not Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_vanilla and not Global_Values.added_strawberry:
			self.texture = vanilla
			Global_Values.added_vanilla = true
		else:
			error_sound.play()
	else:
		error_sound.play()

func _reset() -> void:
	self.texture = empty
	Global_Values.milkpumps = 0
	Global_Values.added_coffee = false
	Global_Values.added_strawberry = false
	Global_Values.added_vanilla = false
	Global_Values.added_chocolate = false
