extends AgentParameters

var age_adult = 18
var age_retirement = 64
var jobs = ["Farmer","Executive","Intermediate occupation","Employee","Worker","Unemployed - under Unemployment benefit","Unemployed - under Solidarity income benefit"]
var probability = [0.0,4.2,14.6,29.2,45,57,64.1,70.1] #le reste ce sont les retraités, donc le cumul total n'est pas 100%

func _initialize(constraint:Dictionary)->Dictionary:
	if "Age" not in constraint.keys() : push_error("Cannot initialize AgentParameter because constraint Age was not found")
	
	if constraint["Age"] < age_adult : output["Occupation"] = "Child"
	elif constraint["Age"] > age_retirement : output["Occupation"] = "Retired"
	else :
		var dice = randf_range(0.0,probability[-1])
		var i = 0
		while dice > probability[i]: i += 1
		output["Occupation"] = jobs[i-1]
	return output
