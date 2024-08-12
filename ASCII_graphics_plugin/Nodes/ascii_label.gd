class_name ASCIILabel

extends Label

func _ready():
	assert(AsciiGraphicsPlugin.check_grid_conforming(self.position,self.size),self.name+" node size is not a mulitple of tile size.")
