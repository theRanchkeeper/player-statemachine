class_name Player
extends KinematicBody2D

#player properties
export var max_speed = 500
export var acceleration = 25
export var sprint = 50

var velocity : Vector2 = Vector2.ZERO


onready var player_fsm = $PlayerFSM

# Called when the node enters the scene tree for the first time.
func _ready():
	player_fsm.init(self)

func _process(delta: float) -> void:
	player_fsm.process(delta)

func _physics_process(delta: float) -> void:
	player_fsm.physics_process(delta)

func _unhandled_input(event: InputEvent) -> void:
	player_fsm.unhandled_input(event)
