extends StaticBody3D

var makecoffee_scence = load("res://scenes/coffee_minigame.tscn")
var makecoffee

func interact() -> void:
	if not Global_Values.in_dialogue:
		makecoffee = makecoffee_scence.instantiate()
	
		var player = get_tree().current_scene.get_node("Player")
		makecoffee.set_player(player)
	
		get_tree().current_scene.process_mode = Node.PROCESS_MODE_DISABLED
		get_tree().root.add_child(makecoffee)
		%Player._free_mouse()
	
