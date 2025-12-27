extends Control

var display = ["Age","Gender"]

func _ready() -> void:
	Broadcast.change_selected.connect(_on_change_selected)

func _on_change_selected(who) -> void :
	if who !=null :
		$ASCIITitleBox.title_text = who.Attributes["Name"]
		for variable in display:
			$ASCIITitleBox/ASCIILabel.text += variable+": "+str(who.Attributes[variable])+"\r"
	else :
		$ASCIITitleBox.title_text = "Pop info"
		$ASCIITitleBox/ASCIILabel.text = ""
