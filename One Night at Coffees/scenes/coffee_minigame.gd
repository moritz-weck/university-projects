extends Node2D
@onready var serve_button: Button = $serve/Sprite2D/serve_button
@onready var serve_hover: Sprite2D = $serve_hover
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var trash_hover: Sprite2D = $trash_hover
@onready var coffeemachine_hover: Sprite2D = $coffeemachine_hover

const _3D_SCENE = preload("res://scenes/3d_scene.tscn")
@onready var sprite_2d: Sprite2D = $serve/Sprite2D

func _ready() -> void:
	serve_hover.visible = false
	trash_hover.visible = false
	coffeemachine_hover.visible = false
	
var player: Node = null
func set_player(p):
	player = p

func _on_serve_button_pressed() -> void:
	player._capture_mouse()
	queue_free()
	get_tree().current_scene.process_mode = Node.PROCESS_MODE_INHERIT




func _on_serve_button_mouse_entered() -> void:
	serve_hover.visible = true
	

func _on_serve_button_mouse_exited() -> void:
	serve_hover.visible = false


func _on_audio_stream_player_2d_finished() -> void:
	audio_stream_player_2d.play()


func _on_button_mouse_entered() -> void:
	trash_hover.visible = true


func _on_button_mouse_exited() -> void:
	trash_hover.visible = false


func _on_machine_button_mouse_entered() -> void:
	coffeemachine_hover.visible = true


func _on_machine_button_mouse_exited() -> void:
	coffeemachine_hover.visible = false
