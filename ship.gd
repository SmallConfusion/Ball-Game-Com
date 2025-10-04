class_name Ship
extends Area2D

@onready var end_menu: PanelContainer = %EndMenu
@onready var restart_button: Button = $"../CanvasLayer/EndMenu/MarginContainer/VBoxContainer/RestartButton"

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	area_entered.connect(func(_x): _died())
	end_menu.visible = false
	restart_button.pressed.connect(func():
		get_tree().paused = false
		get_tree().reload_current_scene()
	)
	
	position = get_global_mouse_position()
	reset_physics_interpolation()

func _physics_process(_delta: float) -> void:
	var old_position := position
	position = get_global_mouse_position()
	var ray_param := PhysicsRayQueryParameters2D.create(old_position, position)
	ray_param.collide_with_areas = true
	var collisions := get_world_2d().direct_space_state.intersect_ray(ray_param)
	
	if not collisions.is_empty():
		_died()

func _died() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true
	end_menu.visible = true
