extends CanvasLayer

@onready var tree_label : Label= $TreeText/HBoxContainer/Update
@onready var sword_label : Label = $"Sword Damage/Damage"

func _ready():
	Globals.connect("stat_change", update_tree_text)
	$"Sword Damage/Damage".text = str(Globals.sword_damage)

func update_tree_text():
	$TreeText/HBoxContainer/Update.text = str(Globals.trees_cut)
	if Globals.trees_cut%3 ==0 :
		update_sword_damage()
		print("update")

func update_sword_damage():
	Globals.sword_damage += 10
	$"Sword Damage/Damage".text = str(Globals.sword_damage)
