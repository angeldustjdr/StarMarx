extends SocialGroup

func group_admission_process(who:Agent)->void:
	if "Age" not in who.parameters.keys(): push_error("Cannot find the Age group because Age is not define in agent :"+who.name)
	
	var age = who.parameters["Age"]
	
	return
