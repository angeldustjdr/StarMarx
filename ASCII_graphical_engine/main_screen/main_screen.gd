extends Control

func _ready():
	$Button.pressed.connect(self._onButtonPressed)

func _onButtonPressed():
	var first_indicator_before = $UpHUD.getIndicatorValue($UpHUD.FIRST_INDICATOR)
	$UpHUD.setIndicatorValue($UpHUD.FIRST_INDICATOR,first_indicator_before+1)
