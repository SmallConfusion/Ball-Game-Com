class_name Circle
extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var movement: Vector2

func initialize(size: float, height: float, movement_: Vector2, color: Color) -> void:
	var new_scale := size / 512.0
	sprite_2d.scale.x = new_scale
	sprite_2d.scale.y = new_scale
	collision_shape_2d.shape.radius = size / 2.1
	
	position.x = -100
	position.y = height
	
	movement = movement_
	
	modulate = color

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	position += movement * delta
	
	if position.x > 1300:
		queue_free()
