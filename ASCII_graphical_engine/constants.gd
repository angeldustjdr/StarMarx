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
