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
@onready var powerup = preload("res://powerup.tscn")

func _process(delta):

	$Sprite2D.rotation_degrees += 10
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
			tile.erase_cell(0,cell)


		if collider == wall:
			speed += 25
			

		if collider == player:
			speed = 200
			player.attack = true
		direction = direction.bounce(collision.get_normal())
		
func spawn_powerup(x: Vector2):
	var powerint = powerup.instantiate()
	powerint.global_position = tile.map_to_local(x)
	get_parent().add_child(powerint)
