extends Node2D

var nb_agent = 100
var time = 0.0

func _ready():
	$AgentManager.initiate(nb_agent)
	$SimulationTick.start()
	


func _on_simulation_tick_timeout():
	$GroupManager.compute_timestep($SimulationTick.wait_time)
	
	for a in $AgentManager.get_children():
		a.print_info()
