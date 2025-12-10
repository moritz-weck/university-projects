extends Control

@export var npc_entrance1: Node3D
@export var npc_entrance2: Node3D
@export var npc_entrance3: Node3D
@export var npc_entrance4: Node3D

var wd2_sprites = [load("res://assets/sprites/npcs/womandog2.png"),load("res://assets/sprites/npcs/womandog3.png"),load("res://assets/sprites/npcs/womandog4.png"),load("res://assets/sprites/npcs/womandog5.png"),load("res://assets/sprites/npcs/womandog6.png"),load("res://assets/sprites/npcs/womandog7.png")]


var npc_queue = []
var simulation_mode = false  # Only enable key press simulation after first dialogue

func _ready() -> void:
	$good_ending.visible = true
	$good_ending.modulate.a = 0.0
	$bad_ending.visible = true
	$bad_ending.modulate.a = 0.0
	
	# Queue your NPCs in order
	npc_queue = [npc_entrance3, npc_entrance1, npc_entrance2, npc_entrance4, npc_entrance3, npc_entrance4]

	# Start initial letter dialogue
	$BlackOverlay.modulate.a = 1.0
	$BlackOverlay.visible = true
	DialogueManager.show_dialogue_balloon(load("res://dialogues/00_letter_mum.dialogue"))
	Global_Values.in_dialogue = true
	DialogueManager.dialogue_ended.connect(_on_dialogue_manager_dialogue_ended)

func _on_dialogue_manager_dialogue_ended(resource: DialogueResource) -> void:
	Global_Values.in_dialogue = false
	
	# When the first dialogue finishes, hide overlay and allow simulation mode
	if resource.resource_path.ends_with("00_letter_mum.dialogue"):
		fade_out()
		simulation_mode = true
		_trigger_next_npc()
	elif resource.resource_path.ends_with("01_02.dialogue"):
		_death()
		await get_tree().create_timer(6).timeout
		DialogueManager.show_dialogue_balloon(load("res://dialogues/01_03.dialogue"))
		Global_Values.in_dialogue = true
		await get_tree().create_timer(5).timeout
		%EntranceBehaviour3.walk_back()
	elif resource.resource_path.ends_with("01_03.dialogue"):
		DialogueManager.show_dialogue_balloon(load("res://dialogues/01_04.dialogue"))
		Global_Values.in_dialogue = true
	elif resource.resource_path.ends_with("01_04.dialogue"):
		_trigger_next_npc()
	elif resource.resource_path.ends_with("02_02.dialogue"):
		DialogueManager.show_dialogue_balloon(load("res://dialogues/02_03.dialogue"))
		Global_Values.in_dialogue = true
	elif resource.resource_path.ends_with("02_03.dialogue"):
		%EntranceBehaviour.walk_back()
		_trigger_next_npc()
	elif resource.resource_path.ends_with("03_02.dialogue"):
		var i = 0
		while i <= 15:
			$BlackOverlay.modulate.a = 1.0
			await get_tree().create_timer(0.1).timeout
			$BlackOverlay.modulate.a = 0.0
			await get_tree().create_timer(0.1).timeout
			i += 1
		DialogueManager.show_dialogue_balloon(load("res://dialogues/03_03.dialogue"))
		Global_Values.in_dialogue = true
	elif resource.resource_path.ends_with("03_03.dialogue"):
		%EntranceBehaviour2.walk_back()
		_trigger_next_npc()
	elif resource.resource_path.ends_with("04_02.dialogue"):
		%EntranceBehaviour4.walk_back()
		_trigger_next_npc()
	elif resource.resource_path.ends_with("05_01.dialogue"):
		%final_timer.start()
	elif resource.resource_path.ends_with("05_02.dialogue"):
		%EntranceBehaviour3.walk_back()
		fade_in()
		await get_tree().create_timer(6).timeout
		fade_out()
		_trigger_next_npc()
	elif resource.resource_path.ends_with("06_01.dialogue"):
		Global_Values.interactable = false
		await get_tree().create_timer(3).timeout
		good_fade_in()

func _trigger_next_npc():
	if Global_Values.current_npc_index < npc_queue.size():
		var next_npc = npc_queue[Global_Values.current_npc_index]
		print("Triggering NPC ", Global_Values.current_npc_index + 1)
		next_npc.walk_in()
		Global_Values.current_npc_index += 1
	else:
		print("All NPCs have walked in.")

func _death():
	Global_Values.in_dialogue = true
	var i = 0
	while i <= 5:
		%NPC3_Sprite3D.texture = wd2_sprites[i]
		await get_tree().create_timer(0.5).timeout
		i += 1
	while %NPC3.position.y >= -10:
		print(get_process_delta_time())
		print(%NPC3.position.y)
		%NPC3.position.y -= get_process_delta_time()*2
		await get_tree().create_timer(0.01).timeout


func _on_final_timer_timeout() -> void:
	if not Global_Values.finished_final:
		bade_fade_in()

func fade_in():
	var tween = create_tween()
	tween.tween_property($BlackOverlay, "modulate:a", 1.0, 1.0) 

func fade_out():
	var tween = create_tween()
	tween.tween_property($BlackOverlay, "modulate:a", 0.0, 1.0)

func good_fade_in():
	var tween = create_tween()
	tween.tween_property($good_ending, "modulate:a", 1.0, 1.0) 
	
func bade_fade_in():
	var tween = create_tween()
	tween.tween_property($bad_ending, "modulate:a", 1.0, 1.0) 
	
