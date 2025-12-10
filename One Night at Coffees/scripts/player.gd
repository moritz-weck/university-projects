extends CharacterBody3D

#This script uses the 3D Player Basic Movement Template
#I adapted the script according to a tutorial to add fist person movement
#most additions should have comments

@export var dialogue: DialogueResource; #neccessary for the dialogue plugin to work

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var neck := $Neck
@onready var camera = $Neck/Camera3D

func _ready():
	pass

func  _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #capture mouse inputs
	elif event.is_action_pressed("ui_cancel"): 
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) #free mouse if escape
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion: #rotate camera and neck when mouse if moving
			neck.rotate_y(-event.relative.x * (0.01 + (Global_Values.sensitivity - 5) * 0.0015)) #since 3 is a full rotation, I multiplied it with a small number, may needs to be changed
			camera.rotate_x(-event.relative.y * (0.01 + (Global_Values.sensitivity - 5) * 0.0015))
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60)) #limit rotation

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized() #determine directions relative to neck
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	%InteractText.hide()
	if $Neck/Camera3D/RayCast3D.is_colliding() and not Global_Values.in_dialogue and Global_Values.interactable:
		var in_vision = $Neck/Camera3D/RayCast3D.get_collider()
		if in_vision != null and in_vision.has_method("interact"):
			%InteractText.show()
			if Input.is_action_just_pressed("interact"):
				in_vision.interact()

func _capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _free_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	%InteractText.hide()
	
