class_name ASCIILabel

extends Label

func _check_size():
	## Check if the size of the label is a multiple of the size of a character.
	## i.e. [Constants.TILE.X,Constants.TILE.Y]
	if (int(self.size.x) % Constants.TILE.X != 0 or 
		int(self.size.y) % Constants.TILE.Y != 0):
		return 1
	return 0

func _ready():
	assert(self._check_size() == 0,self.name+" node size is not a mulitple of tile size.")
