extends EntitiesParent

var health:int = 30
var can_damage: bool = true

var direction: Vector2
var distance: int = 20

func hit():
	if can_damage:
		health -= Globals.sword_damage
		update_health()
		can_damage=false
		$Invulnerability.start()
	if health <= 0:
		$AnimationPlayer.play("slime_death")

func _ready():
	$AnimationPlayer.play("slime_idle")
	update_health()
	can_damage = false
	$Invulnerability.start()
	
func _on_animation_player_animation_finished(_anim_name):
	queue_free()
	
func update_health():
	$ProgressBar.value = health

func _on_child_entered_tree(_node):
	var target_pos = position + up_direction * distance
	var tween = create_tween()
	tween.tween_property(self,"position",target_pos, 0.5)


func _on_invulnerability_timeout():
	can_damage = true

