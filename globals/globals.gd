extends Node
signal stat_change

var sword_damage:int = 10
	

var trees_cut: int = 0.0:
	set(value):
		trees_cut = value
		stat_change.emit()


