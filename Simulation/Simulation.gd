extends Node2D

var nb_agent = 100

func _ready():
	$AgentManager.initiate(nb_agent)
	
