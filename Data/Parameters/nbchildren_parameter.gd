extends AgentParameters

#source https://www.insee.fr/fr/statistiques/4277630?sommaire=4318291
var probability = [0.0,23.0,57.5,87.3,97.1,100.0]
var nb_children = [0,1,2,3,4,10]

func _initialize(_constraint:Dictionary)->Dictionary:
	var dice = randf_range(0.0,100.0)
	var i = 0
	while dice > probability[i]: i += 1
	output["Number of Children"] = randi_range(nb_children[i-1],nb_children[i])
	return output
