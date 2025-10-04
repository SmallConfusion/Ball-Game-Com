class_name Ship
extends Area2D


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	area_entered.connect(func(_x): _died())

func _physics_process(_delta: float) -> void:
	position = get_global_mouse_position()

func _died() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true
