@tool
class_name ASCIIBackgroundBox

extends ASCIIBox

@export var _background_visible: bool = true
@export var _background_color: Color = Color(0,0,0)

func _redraw_if_need():
	super()
	$Background.visible = self._background_visible
	$Background.color = self._background_color
