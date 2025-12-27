extends Node

##########################################
# Gestion Age
var proportion_non_binary = 0.05
var proportion_femme
var age_list
var age_weight

func pyramide_age(fileName):
	var file = FileAccess.open(fileName,FileAccess.READ)
	var pop_totale = 0
	var M = 0
	var F = 0
	var age_proportion = {}
	var data = file.get_csv_line(";")
	while !file.eof_reached():
		data = file.get_csv_line(";")
		if len(data)==4 :
			if data[1] == "M" : M += float(data[3])
			else : F += float(data[3])
			age_proportion[int(data[2])] = float(data[3])
			pop_totale += float(data[3])
	var age_weight = []
	for i in age_proportion.keys() : age_weight.append(age_proportion[i]/pop_totale)
	M /= pop_totale
	F /= pop_totale
	return [F, age_proportion.keys(),age_weight]
	
##########################################
# Initialisation des donnees
func _ready() -> void:
	# gestion de la pyramide des ages
	var age_data = pyramide_age("res://Common/donnees_pyramide_age.txt")
	proportion_femme = age_data[0]
	age_list = age_data[1]
	age_weight = age_data[2]
