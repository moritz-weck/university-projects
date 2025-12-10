extends Node3D

signal interacted

func _ready():
	$Area3D.body_entered.connect(_on_body_entered)
	$Area3D.body_exited.connect(_on_body_exited)

var player_in_range = false

func _on_body_entered(body):
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_range = false

func try_interact():
	if player_in_range:
		emit_signal("interacted")

func interact():
	print("NPC starts talking!")
