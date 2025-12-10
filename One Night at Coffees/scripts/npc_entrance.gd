extends Node

@export var walk_speed: float = 1.5
@export var entrance_marker: Node3D
@export var target_marker: Node3D

signal npc_entered(npc)

func _ready():
	var npc = get_parent()
	if npc and entrance_marker:
		# Place NPC at entrance
		npc.global_transform.origin = entrance_marker.global_transform.origin
	else:
		push_error("EntranceBehaviour: missing parent or entrance_marker!")

# Make this function awaitable
func walk_in() -> void:
	Global_Values.interactable = false
	var npc = get_parent()
	if not npc or not target_marker:
		push_error("walk_in: missing parent or target_marker!")
		return

	while npc.global_transform.origin.distance_to(target_marker.global_transform.origin) > 0.1:
		var direction = (target_marker.global_transform.origin - npc.global_transform.origin).normalized()
		npc.global_translate(direction * walk_speed * get_process_delta_time())
		await get_tree().process_frame

	# Emit signal once finished walking
	emit_signal("npc_entered", npc)
	Global_Values.interactable = true
	
	if Global_Values.current_npc_index == 1:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/01_01.dialogue"))
		Global_Values.in_dialogue = true
	elif Global_Values.current_npc_index == 2:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/02_01.dialogue"))
		Global_Values.in_dialogue = true
	elif Global_Values.current_npc_index == 3:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/03_01.dialogue"))
		Global_Values.in_dialogue = true
	elif Global_Values.current_npc_index == 4:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/04_01.dialogue"))
		Global_Values.in_dialogue = true
	elif Global_Values.current_npc_index == 5:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/05_01.dialogue"))
		Global_Values.in_dialogue = true
	elif Global_Values.current_npc_index == 6:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/06_01.dialogue"))
		Global_Values.in_dialogue = true
	
func walk_back() -> void:
	var npc = get_parent()
	if not npc or not entrance_marker:
		push_error("walk_back: missing parent or entrance_marker!")
		return

	while npc.global_transform.origin.distance_to(entrance_marker.global_transform.origin) > 0.1:
		var direction = (entrance_marker.global_transform.origin - npc.global_transform.origin).normalized()
		npc.global_translate(direction * walk_speed * get_process_delta_time())
		await get_tree().process_frame
