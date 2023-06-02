extends CharacterBody2D


const SPEED = 100.0
var collision
var attack = false
func _physics_process(delta):
	# Add the gravity.

	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED
	if not attack:
		if velocity.x != 0:
			$AnimationPlayer.play("walk")
		else:
			$AnimationPlayer.play("idle")
	else:
		$AnimationPlayer.play("attack",-1,1.5)
	move_and_slide()

func end_attack():
	attack = false
