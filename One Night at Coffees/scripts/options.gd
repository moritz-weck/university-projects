extends Control

var optionbar_sprites = [load("res://assets/sprites/options/optionbar_00.png"), load("res://assets/sprites/options/optionbar_01.png"), load("res://assets/sprites/options/optionbar_02.png"), load("res://assets/sprites/options/optionbar_03.png"), load("res://assets/sprites/options/optionbar_04.png"), load("res://assets/sprites/options/optionbar_05.png"), load("res://assets/sprites/options/optionbar_06.png"), load("res://assets/sprites/options/optionbar_07.png"), load("res://assets/sprites/options/optionbar_08.png"), load("res://assets/sprites/options/optionbar_09.png"), load("res://assets/sprites/options/optionbar_10.png")]

func _ready() -> void:
	$volumebar/volumebar_sprite.texture = optionbar_sprites[Global_Values.volume]
	$sensitivitybar/sensitivitybar_sprite.texture = optionbar_sprites[Global_Values.sensitivity]


func _on_volume_minus_pressed() -> void:
	if Global_Values.volume >= 1:
		Global_Values.volume -= 1
		$volumebar/volumebar_sprite.texture = optionbar_sprites[Global_Values.volume]
		if Global_Values.volume >= 1:
			AudioServer.set_bus_volume_db(0, Global_Values.volume * 2)
		else:
			AudioServer.set_bus_mute(0,true)


func _on_volume_plus_pressed() -> void:
	if Global_Values.volume <= 9:
		Global_Values.volume += 1
		$volumebar/volumebar_sprite.texture = optionbar_sprites[Global_Values.volume]
		AudioServer.set_bus_volume_db(0, Global_Values.volume * 2)
		AudioServer.set_bus_mute(0,false)


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/menu.tscn')


func _on_sensitivity_minus_pressed() -> void:
	if Global_Values.sensitivity >= 1:
		Global_Values.sensitivity -= 1
		$sensitivitybar/sensitivitybar_sprite.texture = optionbar_sprites[Global_Values.sensitivity]


func _on_sensitivity_plus_pressed() -> void:
	if Global_Values.sensitivity <= 9:
		Global_Values.sensitivity += 1
		$sensitivitybar/sensitivitybar_sprite.texture = optionbar_sprites[Global_Values.sensitivity]
