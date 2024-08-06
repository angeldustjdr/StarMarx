class_name ASCIIBoxLabel

extends ASCIILabel

# Size attributes
@export var size_tile : Vector2i = Vector2i(3,3) # size of the box in tiles. /!\ (j,i), i.e. columns first, then lines.

# Drawing attributes
@export var _vertical_line_char = '#'
@export var _horizontal_line_char = '#'
@export var _up_left_corner_char = '#'
@export var _up_right_corner_char = '#'
@export var _down_left_corner_char = '#'
@export var _down_right_corner_char = '#'

func _ready():
	super()
	self._draw_box()

func _compute_box_str():
	var box_str : String = (self._up_left_corner_char + 
							self._horizontal_line_char.repeat(self.size_tile[0]-2) +
							self._up_right_corner_char+"\n") # first line
	for j in range(0,self.size_tile[1]-1): # we loop over the remaining lines except the last one...
		box_str += (self._vertical_line_char +
					" ".repeat(self.size_tile[0]-2) +
					self._vertical_line_char+"\n")
	box_str += (self._down_left_corner_char + 
				self._horizontal_line_char.repeat(self.size_tile[0]-2) +
				self._down_right_corner_char) # last line
	return box_str
		
func _draw_box():
	self._compute_size_tile()
	self.text = self._compute_box_str()

func _compute_size_tile():
	self.size_tile.x = self.size.x / Constants.TILE.X
	self.size_tile.y = self.size.y / Constants.TILE.Y
