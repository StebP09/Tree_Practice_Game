extends StaticBody2D
signal open(pos,direction)
var current_direction:Vector2 = Vector2(Vector2.DOWN.rotated(rotation))
var opened: bool = false

func hit() -> void:
	if opened == false:
		$AnimationPlayer.play("open")
		opened = true
		var pos = $ItemSpawnPoint.global_position
		open.emit(pos,current_direction)
	

