extends Node2D

var Agent = preload("res://Component/agent.tscn")

func initiate(N:int)->void:
	for i in range(N):
		var a = Agent.instantiate()
		add_child(a)
