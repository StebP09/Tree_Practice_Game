extends Node2D

var slime_scene: PackedScene = preload("res://Scenes/Entities/slime.tscn")

func _ready():
	for chest in get_tree().get_nodes_in_group("Chest"):
		chest.connect("open",on_open)

#signal from chest
func on_open(pos, direction):
	var slime = slime_scene.instantiate()
	slime.position = pos
	slime.up_direction = direction
	#in code timer
	await get_tree().create_timer(.75).timeout
	$Enemies.call_deferred("add_child",slime)
