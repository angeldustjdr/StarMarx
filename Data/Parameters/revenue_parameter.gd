extends AgentParameters

var insee_data = {
	"Child" : {
		"ProbaCumul Niveau de vie" : [0.0,100.0],
		"RevenuParDecile" : [0,0],
	},
	"Farmer" : {
		"ProbaCumul Niveau de vie" : [0.0,16.7, 27.2, 36.5, 43.7, 50.3, 57.8, 64.3, 72.1, 82.4, 100.0],
		"RevenuParDecile" : [9140,13408,17676,21944,26212,30480,34748,39016,43284,47552,51820],
	},
	"Executive" : {
		"ProbaCumul Niveau de vie" : [0.0,2.8,4.2,6.1,8.8,12.9,18.8,26.1,40.7,62.7,100],
		"RevenuParDecile" : [19710,24006,28302,32598,36894,41190,45486,49782,54078,58374,62670],
	},
	"Intermediate occupation" : {
		"ProbaCumul Niveau de vie" : [0.0,4.1,7.9,13.6,21.3,31.1,42.9,58,73.9,89.5,100],
		"RevenuParDecile" : [15330,17770,20210,22650,25090,27530,29970,32410,34850,37290,39730],
	},
	"Employee" : {
		"ProbaCumul Niveau de vie" : [0.0,8.6,18.7,30.4,43.8,56.9,69.2,79.7,89.1,96,100],
		"RevenuParDecile" : [11680,13662,15644,17626,19608,21590,23572,25554,27536,29518,31500],
	},
	"Worker" : {
		"ProbaCumul Niveau de vie" : [0.0,10,21.4,34.1,46.4,59.1,71.8,83.6,92.4,98,100],
		"RevenuParDecile" : [11200,13017,14834,16651,18468,20285,22102,23919,25736,27553,29370],
	},
	"Retired" : { #Source : https://drees.solidarites-sante.gouv.fr/sites/default/files/2021-05/Fiche%2009%20-%20Le%20niveau%20de%20vie%20des%20retrait%C3%A9s.pdf
		"ProbaCumul Niveau de vie" : [0.0,13,35,57,79,100],
		"RevenuParDecile" : [7293,11640,116680,121360,26880,46320]
	},
	"Unemployed - under Unemployment benefit" : {#source : https://www.insee.fr/fr/statistiques/7456885?sommaire=7456956#tableau-figure2
		"ProbaCumul Niveau de vie" : [0.0,2.0,4.9,42,53.7,62.7,69.8,76.2,82,87.5,92.9,100],
		"RevenuParDecile" : [7293,7293,12000,12787,13573,14360,15147,15933,16720,17507,18293,19080],
	},
	"Unemployed - under Solidarity income benefit" : {#source : https://drees.solidarites-sante.gouv.fr/sites/default/files/2022-12/AAS22-Fiche%2033%20-%20Les%20b%C3%A9n%C3%A9ficiaires%20du%20revenu%20de%20solidarit%C3%A9%20active%20%28RSA%29.pdf
		"ProbaCumul Niveau de vie" : [0.0,100.0],
		"RevenuParDecile" : [7293,7293],
	}
}

var ecartSalarialHommeFemme = 0.24 #source : https://www.insee.fr/fr/statistiques/:~:text=En%20moyenne,%20le%20volume%20de,%C3%A9l%C3%A8ve%20%C3%A0%2015,5%20%.#tableau-figure1_radio1

func _initialize(constraint:Dictionary)->Dictionary:
	if "Occupation" not in constraint.keys() : push_error("Cannot initialize AgentParameter because constraint Occupation was not found")
	
	var dice = randf_range(0.0,100.0)
	var myJob = constraint["Occupation"]
	var probability = insee_data[myJob]["ProbaCumul Niveau de vie"]
	var revenue = insee_data[myJob]["RevenuParDecile"]
	var i = 0
	while dice > probability[i]: i += 1
	output["Revenue"] = int(randi_range(revenue[i-1],revenue[i]) /12.0) #Revenue mensuel en euro
	if constraint["Gender"] != "Male" : output["Revenue"] *= (1-ecartSalarialHommeFemme)
	return output
