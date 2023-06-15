extends CharacterBody2D

var rot = 45
@onready var tile = $"../TileMap"
@onready var player = $"../CharacterBody2D"
@onready var wall = $"../TileMap2"
var direction = Vector2(0,1)
var motion: Vector2
var collision
var power = 0
var speed = 150
var max_speed = 150

var state = 0
var startPos
@onready var powerup = preload("res://powerup.tscn")

func _ready():
	startPos = global_position
func _process(delta):
	match(state):
		0:
			if(Input.is_action_just_pressed('ui_accept')):
				state = 1
		1:
			ball_state(delta)
			
		2:
			$GPUParticles2D/PointLight2D.enabled = false
			Globals.gameOver = true
	$Sprite2D.rotation_degrees += 10
	

func ball_state(delta):
	motion = direction*speed * delta
	collision = move_and_collide(motion)
	get_collision()
	
func get_collision():
	if collision != null:
		var collider = collision.get_collider()
		var colliderPosition = collision.get_position()
		if collider == tile:
			speed = 150
			var cell = tile.local_to_map(colliderPosition+direction)
			if randi_range(0,10) == 10:
				spawn_powerup(cell)
				randomize()
			Globals.points += 100
			tile.erase_cell(0,cell)


		if collider == wall:
			speed += 25
			

		if collider == player:
			speed = 200
			player.attack = true

		direction = direction.bounce(collision.get_normal())
		if collider == player:
			direction.y = -abs(direction.y)
		
func spawn_powerup(x: Vector2):
	var powerint = powerup.instantiate()
	powerint.global_position = tile.map_to_local(x)
	get_parent().add_child(powerint)


func _on_visible_on_screen_notifier_2d_screen_exited():
	if(Globals.lives <= 1):
		state = 2
		Globals.lives -=1
	else:
		Globals.lives -= 1
		state = 0
		direction = Vector2(0,1)
		global_position = startPos
