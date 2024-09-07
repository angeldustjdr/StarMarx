extends Node2D

func compute_timestep(dt:float)->void:
	for group in self.get_children():
		group.compute_timestep(dt)
	return
