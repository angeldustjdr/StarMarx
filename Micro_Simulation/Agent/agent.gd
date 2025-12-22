extends CharacterBody2D

var length = 1000
var Attributes : Dictionary

enum STATUS {STOP,ROAM}

func  init(Id) -> void:
	# Identification
	self.Attributes["Id"] = Id
	# Postional information
	self.position.x = int(randf()*DisplayServer.window_get_size()[0])
	self.position.y = int(randf()*DisplayServer.window_get_size()[1])
	self.Attributes["Status"] = STATUS.ROAM

func _ready() -> void:
	$ASCIILabel.text = str(self.Attributes["Id"])

func _on_move_timer_timeout() -> void:
	$Move_Timer.wait_time = randf_range(0.5,1.5)
	move_agent()
	
func move_agent():
	match self.Attributes["Status"] :
		STATUS.STOP :
			return
		STATUS.ROAM :
			self.velocity = Vector2(randf_range(-length,length),randf_range(-length,length))
			move_and_slide()


func _on_mouse_entered() -> void:
	self.Attributes["Status"] = STATUS.STOP
	$ASCIILabel.visible = true
	self.modulate=Color(1.0, 0.125, 0.086, 1.0)
	
func _on_mouse_exited() -> void:
	self.Attributes["Status"] = STATUS.ROAM
	$ASCIILabel.visible = false
	self.modulate=Color("#ffffff")
