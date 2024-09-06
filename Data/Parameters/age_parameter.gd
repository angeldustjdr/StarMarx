extends AgentParameters

var age_range = [0,15,19,24,29,34,39,44,49,54,59,64,69,74,100]
var probability = [0,17,23.3,29.1,34.6,40.5,46.7,53,59.1,65.7,72.2,78.4,84.1,89.5,100]

func _initialize(_constraint:Dictionary)->Dictionary:
	var dice = randf_range(0.0,100.0)
	var i = 0
	while dice > probability[i]: i += 1
	output["Age"] = randi_range(age_range[i-1],age_range[i])
	return output
