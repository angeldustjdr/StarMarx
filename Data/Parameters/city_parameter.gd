extends AgentParameters

#source : https://www.insee.fr/fr/statistiques/4806694#graphique-figure2
var city = ["Capital City","Metropolis","Big Town","Small Town","Village","Tiny Village"]
var probability = [0.0,19.5,39.2,57.6,81.2,93.4,100.0]

func _initialize(constraint:Dictionary)->Dictionary:
	if "Occupation" not in constraint.keys() : push_error("Cannot initialize AgentParameter because constraint Occupation was not found")
	
	var dice = randf_range(0.0,100.0)
	if constraint["Occupation"]=="Farmer":
		if dice > 50 : output["Lives in"] = "Village"
		else : output["Lives in"] = "Tiny Village"
	else :
		var i = 0
		while dice > probability[i]: i += 1
		output["Lives in"] = city[i-1]
	return output
