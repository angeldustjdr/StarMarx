extends AgentParameters

var gender = ["Female","Male","Queer"]
var probability = [0.0,48,96,100]

func _initialize(_constraint:Dictionary)->Dictionary:
	var dice = randf_range(0.0,100.0)
	var i = 0
	while dice > probability[i]: i += 1
	output["Gender"]=gender[i-1]
	return output
