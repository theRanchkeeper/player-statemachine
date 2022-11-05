class_name PlayerFSM
extends Node

onready var idle_state : BaseState = $IdleState
onready var walking_state : BaseState = $WalkState
onready var running_state : BaseState = $RunState 

onready var initial_state : BaseState = idle_state
var current_state : BaseState


func init(player) -> void:
	
	for child in get_children():
		child.target = player
		
	_change_to(initial_state)

func _change_to(new_state : BaseState):
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()


func _on_PlayerFSM_switch_to(new_state) -> void:
	
	match(new_state):
		
		"IDLE":
			_change_to(idle_state)
		"WALKING":
			_change_to(walking_state)
		"RUNNING":
			_change_to(running_state)


func _ready() -> void:
	pass


func process(delta: float) -> void:
	current_state.update(delta)


func physics_process(delta: float) -> void:
	current_state.physics_update(delta)


func unhandled_input(event: InputEvent) -> void:
	current_state.input(event)
