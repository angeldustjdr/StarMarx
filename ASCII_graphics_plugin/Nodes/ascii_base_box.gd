@tool
class_name ASCIIBox

extends Control

# Size attributes
@export var size_in_tiles : Vector2i = Vector2i(3,3) # size of the box in tiles. /!\ (j,i), i.e. columns first, then lines.

# Drawing attributes
@export var _vertical_line_char = '#'
@export var _horizontal_line_char = '#'
@export var _up_left_corner_char = '#'
@export var _up_right_corner_char = '#'
@export var _down_left_corner_char = '#'
@export var _down_right_corner_char = '#'

func _ready():
	self._redraw_if_need()

func _compute_box_str():
	var box_str : String = (self._up_left_corner_char + 
							self._horizontal_line_char.repeat(self.size_in_tiles[0]-2) +
							self._up_right_corner_char+"\n") # first line
	for j in range(1,self.size_in_tiles[1]-1): # we loop over the remaining lines except the last one...
		box_str += (self._vertical_line_char +
					" ".repeat(self.size_in_tiles[0]-2) +
					self._vertical_line_char+"\n")
	box_str += (self._down_left_corner_char + 
				self._horizontal_line_char.repeat(self.size_in_tiles[0]-2) +
				self._down_right_corner_char) # last line
	return box_str
		
func _draw_box():
	$BoxLabel.text = self._compute_box_str()
	
func _notification(what):
	match what:
		NOTIFICATION_RESIZED:
			self._redraw_if_need()

func _redraw_if_need():
	if AsciiGraphicsPlugin.size_in_tiles_changed(self.size,self.size_in_tiles):
			self.size_in_tiles = AsciiGraphicsPlugin.compute_size_in_tiles(self.size)
			self._draw_box()
	
