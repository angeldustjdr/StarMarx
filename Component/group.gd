extends Node2D
class_name SocialGroup

@export var group_name :String
@export var list_of_subgroup :Array[String]
var list_of_agents :Dictionary

func _ready():
	SignalHub.connect("looking_for_group",group_admission_process)
	init_subgroups(list_of_subgroup)
	
func group_admission_process(who:Agent)->void:
	return

func init_subgroups(subgroups:Array)->void:
	for sub in subgroups:
		list_of_agents[sub] = []
	return

func add_to_subgroup(my_subgroup:String,added_agent:Agent)->void:
	if my_subgroup not in list_of_agents.keys(): push_error("Not subgroup "+my_subgroup+" in group "+group_name)
	
	list_of_agents[my_subgroup].append(added_agent)
	return
