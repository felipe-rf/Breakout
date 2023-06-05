extends CharacterBody2D

@onready var bum = $"../bum"

const SPEED = 200.0
var collision
var attack = false

func _physics_process(delta):
	# Add the gravity.

	var direction = Input.get_axis("ui_left", "ui_right")
	#var direction = sign(get_global_mouse_position()-global_position).x
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

func get_power(pow):
	bum.power = 1
