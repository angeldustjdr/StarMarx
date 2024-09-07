extends Node2D
class_name SocialGroup

@export var group_name :String
var list_of_agents :Dictionary

func _ready():
	SignalHub.connect("looking_for_group",group_admission_process)
	
func group_admission_process(_who:Agent)->void:
	return

func add_to_subgroup(my_subgroup:String,added_agent:Agent)->void:
	if my_subgroup not in list_of_agents.keys(): list_of_agents[my_subgroup] = []
	
	list_of_agents[my_subgroup].append(added_agent)
	return

func compute_timestep(_dt:float)->void:
	return

func print_info()->void:
	var M = 0
	for subgroup in list_of_agents:
		for agent in list_of_agents[subgroup]:
			print(subgroup," ",agent.parameters)
			M+=1
	print("Total members : ",M)
	print("Nb Subgroup : ",len(list_of_agents.keys()))
	return
