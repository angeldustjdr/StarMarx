@tool
extends Node

enum TILE {X = 8, Y = 16}
enum WINDOW_SIZE {X = 640, Y = 480, # in pixels
				  J = 80,  I = 30} # number of tiles, I number of lines (Y), J number of columns (X)

func _ready():
	assert(WINDOW_SIZE.X == WINDOW_SIZE.J * TILE.X, "WINDOW_SIZE mismatch.")
	assert(WINDOW_SIZE.Y == WINDOW_SIZE.I * TILE.Y, "WINDOW_SIZE mismatch.")
	assert(self._check_project_settings() == 0,"Project settings for window are not matching the constants.gd ones.")

func _check_project_settings():
	## Checks that the project settings related to window size are consistent with the enum. 
	var p_settings_wx = ProjectSettings.get_setting("display/window/size/viewport_width")
	var p_settings_wy = ProjectSettings.get_setting("display/window/size/viewport_height")
	if p_settings_wx != WINDOW_SIZE.X or p_settings_wy != WINDOW_SIZE.Y:
		return 1
	else:
		return 0

func check_grid_conforming(p:Vector2,s:Vector2) -> bool:
	## Check if the bounding box of the node is grid conforming.
	# p : Vector2 : position of the checked node
	# s : Vector2 : size of the checked node.
	## More precisely:
	## - The size in pixels is a multiple of the tile size in pixel (default 8x16).
	## - The position in pixels is a multiple of the 
	## Return true if the nodes is conforming, false else.
	## i.e. [ascii_graphics_plugin.TILE.X,ascii_graphics_plugin.TILE.Y]
	if (int(s.x) % TILE.X != 0 or 
		int(s.y) % TILE.Y != 0 or
		int(p.x) % TILE.X != 0 or
		int(p.y) % TILE.Y != 0 ):
		return false
	return true
	
func size_in_tiles_changed(s: Vector2,st: Vector2i) -> bool:
	## Checks if the size in tiles has changed.
	# s: Vector2 current size in pixel
	# st: Vector2i size in tiles
	## Return true if the size in tiles has changed. False else. 
	if (st.x != int(s.x/TILE.X) or 
		st.y != int(s.y/TILE.X)):
		return true
	else:
		return false

func compute_size_in_tiles(s: Vector2) -> Vector2i:
	## Compute the size in tiles regarding the tile size and the node size in pixels. 
	# s : Vector2 : size of the checked node.
	## /!\ truncated and not rounded.
	return Vector2i(int(s.x / TILE.X),int(s.y / TILE.Y))
	
