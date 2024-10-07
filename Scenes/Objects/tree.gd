extends StaticBody2D

var health: int = 50

func hit():
	health -= Globals.sword_damage
	if health <= 0:
		Globals.trees_cut +=1
		$AnimationPlayer.play("cut")
		

func _ready():
	$AnimationPlayer.play("uncut")
