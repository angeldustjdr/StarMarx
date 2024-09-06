extends Node
class_name Agent

var parameters :Dictionary

func _ready():
	for param in $Parameters.get_children():
		set_parameter(param._initialize(parameters))
	SignalHub.emit_signal("looking_for_group",self)
	print(parameters)

func set_parameter(param:Dictionary)->void:
	for key in param : parameters[key] = param[key]
