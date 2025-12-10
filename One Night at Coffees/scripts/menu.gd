extends Control
@onready var hover_start: TextureRect = $hover_start
@onready var hover_settings: TextureRect = $hover_settings
@onready var hover_exit: TextureRect = $hover_exit
@onready var music_menu: AudioStreamPlayer2D = $music_menu



func _ready() -> void:
	hover_start.visible = false
	hover_settings.visible = false
	hover_exit.visible = false
	
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/3d_scene.tscn')


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/options.tscn')


func _on_exit_pressed() -> void:
	get_tree().quit()




func _on_start_mouse_entered() -> void:
	hover_start.visible = true


func _on_start_mouse_exited() -> void:
	hover_start.visible = false
	
	
	


func _on_settings_mouse_entered() -> void:
	hover_settings.visible = true


func _on_settings_mouse_exited() -> void:
	hover_settings.visible = false


func _on_exit_mouse_entered() -> void:
	hover_exit.visible = true


func _on_exit_mouse_exited() -> void:
	hover_exit.visible = false


func _on_music_menu_finished() -> void:
	music_menu.play()
