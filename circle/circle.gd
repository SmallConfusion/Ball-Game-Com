class_name Circle
extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func initialize(size: float) -> void:
	var new_scale := size / 512.0
	sprite_2d.scale.x = new_scale
	sprite_2d.scale.y = new_scale
	collision_shape_2d.shape.radius = size

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func _process(_delta: float) -> void:
	pass
