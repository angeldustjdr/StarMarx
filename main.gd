extends Node2D

@onready var agent = load("res://Micro_Simulation/Agent/Agent.tscn")

var N_max = 100

func _ready() -> void:
	for i in range(N_max):
		var myAgent = agent.instantiate()
		myAgent.init(i,DisplayServer.window_get_size()-Vector2i($UI.size.x,0))
		$Micro_Simulation.add_child(myAgent)

func _on_timer_timeout() -> void:
	print('coucou')
