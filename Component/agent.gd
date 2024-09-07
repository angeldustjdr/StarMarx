extends Node
class_name Agent

var parameters :Dictionary

func _ready():
	for param in $Parameters.get_children():
		set_parameter(param._initialize(parameters))
	SignalHub.emit_signal("looking_for_group",self)

func set_parameter(param:Dictionary)->void:
	for key in param : parameters[key] = param[key]

func update(param:String,value:float)->void:
	parameters[param] += value
	parameters[param] = clamp(parameters[param],-100,100)
	return

func print_info()->void:
	print(parameters)
	return
