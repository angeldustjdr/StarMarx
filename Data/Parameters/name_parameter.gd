extends AgentParameters

var nb_letters = 12

func _initialize(_constraint:Dictionary)->Dictionary:
	var abc = "abcdefghijklmnopqrstuvwxyz0123456789"
	var myName = ""
	for i in range(nb_letters) : myName += abc[randi()%len(abc)]
	output["Name"] = myName
	return output
