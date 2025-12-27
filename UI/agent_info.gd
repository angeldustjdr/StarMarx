extends Control

func _ready() -> void:
	Broadcast.change_selected.connect(_on_change_selected)

func _on_change_selected(who) -> void :
	if who !=null :
		$ASCIITitleBox.title_text = who.Attributes["Name"]
	else :
		$ASCIITitleBox.title_text = "Pop info"
