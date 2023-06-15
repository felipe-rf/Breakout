extends CharacterBody2D

@onready var bum = $"../bum"

const SPEED = 200.0
var collision
var attack = false
var Ypos
func _ready():
	Ypos = global_position.y
func _physics_process(delta):
	# Add the gravity.

	var direction = Input.get_axis("ui_left", "ui_right")
	#var direction = sign(get_global_mouse_position()-global_position).x
	if !Globals.gameOver:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
	velocity.y = 0
	global_position.y = Ypos
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
