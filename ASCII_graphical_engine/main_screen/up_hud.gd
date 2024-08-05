extends CanvasLayer

enum {FIRST_INDICATOR = 1, SECOND_INDICATOR = 2, THIRD_INDICATOR = 3}

@onready var _indicator_values = {FIRST_INDICATOR:0,SECOND_INDICATOR:0,THIRD_INDICATOR:0}

func setIndicatorValue(indicator,value):
	self._indicator_values[indicator] = value
	self.get_node("Indicator"+str(indicator)+"Value").text = str(value)

func getIndicatorValue(indicator):
	return self._indicator_values[indicator]
