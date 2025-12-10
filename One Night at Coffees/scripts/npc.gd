extends CharacterBody3D
		
var player_in_range = false

func _ready():
	# Connect the area signals
	$InteractArea.body_entered.connect(_on_area_entered)
	$InteractArea.body_exited.connect(_on_area_exited)

func _on_area_entered(body):
	if body.name == "Player":  # or check by group if you prefer
		player_in_range = true

func _on_area_exited(body):
	if body.name == "Player":
		player_in_range = false

func interact() -> void:
	if Global_Values.current_npc_index == 1:
		if not Global_Values.added_coffee and not Global_Values.milkpumps >= 1 and not Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/01_empty.dialogue"))
		elif Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/01_02.dialogue"))
		else:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/01_false_order.dialogue"))
	elif Global_Values.current_npc_index == 2:
		if not Global_Values.added_coffee and not Global_Values.milkpumps >= 1 and not Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/02_empty.dialogue"))
		elif not Global_Values.added_coffee and Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/02_02.dialogue"))
		elif not Global_Values.added_coffee and not Global_Values.added_chocolate and not Global_Values.added_strawberry and Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/02_02.dialogue"))
		else:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/02_false_order.dialogue"))
	elif Global_Values.current_npc_index == 3:
		if not Global_Values.added_coffee and not Global_Values.milkpumps >= 1 and not Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/03_empty.dialogue"))
		elif not Global_Values.added_coffee and not Global_Values.added_chocolate and Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/03_02.dialogue"))
		else:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/03_false_order.dialogue"))
	elif Global_Values.current_npc_index == 4:
		if not Global_Values.added_coffee and not Global_Values.milkpumps >= 1 and not Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/04_empty.dialogue"))
		elif Global_Values.added_coffee and Global_Values.milkpumps >= 2 and not Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/04_02.dialogue"))
		else:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/04_false_order.dialogue"))
	elif Global_Values.current_npc_index == 5:
		if not Global_Values.added_coffee and not Global_Values.milkpumps >= 1 and not Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/05_empty.dialogue"))
		elif Global_Values.added_coffee and Global_Values.milkpumps == 1 and not Global_Values.added_chocolate and not Global_Values.added_strawberry and not Global_Values.added_vanilla:
			Global_Values.finished_final = true
			DialogueManager.show_dialogue_balloon(load("res://dialogues/05_02.dialogue"))
		else:
			DialogueManager.show_dialogue_balloon(load("res://dialogues/05_false_order.dialogue"))
	Global_Values.milkpumps = 0
	Global_Values.added_coffee = false
	Global_Values.added_strawberry = false
	Global_Values.added_vanilla = false
	Global_Values.added_chocolate = false
	Global_Values.in_dialogue = true
