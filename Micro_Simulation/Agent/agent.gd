extends CharacterBody2D

const NAMES = preload("res://Common/NAMES.gd")

var length = 50
var Attributes : Dictionary

enum STATUS {STOP,ROAM}

func  init(Id,spawn_rect) -> void:
	# Identification
	self.Attributes["Id"] = Id
	# Generate personal info
	self.Attributes["Name"] = NAMES.noms.pick_random() + " " + NAMES.prenoms.pick_random()
	self.Attributes["Age"] = randi_range(18,99)
	# Postional information
	self.position.x = int(randf()*spawn_rect[0] + DisplayServer.window_get_size()[0] - spawn_rect[0])
	self.position.y = int(randf()*spawn_rect[1])
	self.Attributes["Status"] = STATUS.ROAM

func _process(_delta: float) -> void:
	match self.Attributes["Status"] :
		STATUS.STOP :
			return
		STATUS.ROAM :
			move_and_slide()

func _on_move_timer_timeout() -> void:
	$Move_Timer.wait_time = randf_range(1.0,2.5)
	self.velocity = Vector2(randf_range(-length,length),randf_range(-length,length))


func _on_mouse_entered() -> void:
	self.Attributes["Status"] = STATUS.STOP
	self.modulate=Color(1.0, 0.125, 0.086, 1.0)
	Broadcast.change_selected.emit(self)
	
func _on_mouse_exited() -> void:
	self.Attributes["Status"] = STATUS.ROAM
	self.modulate=Color("#ffffff")
	Broadcast.change_selected.emit(null)
