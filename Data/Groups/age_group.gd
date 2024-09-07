extends SocialGroup

@export var age_effect_on_tradition :Curve
@export var coef = 10.0


func group_admission_process(who:Agent)->void:
	if "Age" not in who.parameters.keys(): push_error("Cannot find the Age group because Age is not define in agent :"+who.name)
	
	var age = who.parameters["Age"]
	if age<18 : add_to_subgroup("Minor",who)
	elif age<26 : add_to_subgroup("18-25",who)
	elif age<36 : add_to_subgroup("26-35",who)
	elif age<46 : add_to_subgroup("36-45",who)
	elif age<56 : add_to_subgroup("46-55",who)
	elif age<66 : add_to_subgroup("56-65",who)
	elif age<76 : add_to_subgroup("66-75",who)
	else : add_to_subgroup("Over 76",who)
	
	return

func compute_timestep(_dt:float)->void:
	for key in list_of_agents:
		for a in list_of_agents[key]:
			var x = a.parameters["Age"] / 100.0
			var y = (age_effect_on_tradition.sample(x) - 0.5) * coef
			a.update("Tradition",y)
	return
