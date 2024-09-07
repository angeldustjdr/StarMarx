extends Node2D

var myAgent = preload("res://Component/agent.tscn")

func initiate(N:int)->void:
	for i in range(N):
		var a = myAgent.instantiate()
		add_child(a)
