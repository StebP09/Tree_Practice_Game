extends EntitiesParent

var speed: int = 10000
var input = Input.get
var play = 0
var can_walk:bool = true

func _ready():
	$AnimationPlayer.play("idle")

func _process(delta):
	var direction = Input.get_vector("left", "right", 'up' , "down")
	velocity = direction * speed * delta
	if can_walk:
		move_and_slide()

func _input(_event):
	#plays animation depending on input
	if can_walk:
		
	#walk right
		if Input.is_action_pressed("right"):
			$AnimationPlayer.play("walking_side")
			#keep sprite in base orientation 
			$Sprite2D.flip_h = false
	#walk left
		elif Input.is_action_pressed("left"):
			$AnimationPlayer.play("walking_side")
		#flip animation
			$Sprite2D.flip_h = true
	#walk down
		elif Input.is_action_pressed("down"):
			$AnimationPlayer.play("walking_down")
	#walk up
		elif Input.is_action_pressed("up"):
			$AnimationPlayer.play("walking_up")
	#attack very buggy must be held
		elif Input.is_action_just_pressed("attack"):
		#keep sprite in base orientation 
			$Sprite2D.flip_h = false
			$AnimationPlayer.play("attack_down")
			can_walk = false
	#left, right, and up attack not working
		elif Input.is_action_just_pressed("left_attack"):
			$AnimationPlayer.play("attack_left")
			$Sprite2D.flip_h = true
			can_walk = false
		elif Input.is_action_just_pressed("right_attack"):
			$AnimationPlayer.play("attack_right")
			$Sprite2D.flip_h = false
			can_walk = false
				
	#elif Input.is_action_just_pressed("attack") and Input.is_action_pressed("up"):
		#$AnimationPlayer.play("attack_up")
	#play idle if no input
		else:
			$AnimationPlayer.play("idle")




func _on_attack_body_entered(body):
	if "hit" in body:
		body.hit()


func _on_animation_player_animation_finished(_anim_name):
	can_walk = true
