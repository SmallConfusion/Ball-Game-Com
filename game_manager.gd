class_name GameManager
extends Node2D

const CIRCLE = preload("uid://clk3awxqbhx3v")

const CIRCLE_SIZE_MIN := 50.0
const CIRCLE_SIZE_MAX := 125.0

@export var circle_colors: Gradient

var time := 0.0
var score := 0

@onready var score_timer: Timer = $ScoreTimer
@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var circle_timer: Timer = $CircleTimer

func _ready() -> void:
	score_timer.timeout.connect(func(): score += 1)
	circle_timer.timeout.connect(_spawn_circle.call_deferred)

func _process(_delta: float) -> void:
	score_label.text = "%d" % score

func _physics_process(delta: float) -> void:
	time += delta

func _spawn_circle() -> void:
	circle_timer.start(_ball_spawn_time_curve())
	
	var circle: Circle = CIRCLE.instantiate()
	add_child(circle)
	
	var size := randf_range(CIRCLE_SIZE_MIN, CIRCLE_SIZE_MAX)
	var color := circle_colors.sample(randf())
	
	var left := randf_range(0, 1080)
	
	var angle := randfn(0.0, 2.0 / 6.0)
	var dir := Vector2.RIGHT.rotated(angle)
	dir *= _ball_speed_time_curve()
	
	circle.initialize(size, left, dir, color)
	

func _ball_spawn_time_curve() -> float:
	return 0.5 * pow(24.0 / 25.0, time)

func _ball_speed_time_curve() -> float:
	var screen_time := 10.0 * pow(60.0 / 61.0, time)
	return 1080.0 / screen_time
