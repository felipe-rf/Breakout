extends CharacterBody2D

var rot = 45
@onready var tile = $"../TileMap"
@onready var player = $"../CharacterBody2D"
@onready var wall = $"../TileMap2"
var direction = Vector2(0,1)
var motion
var collision

func _process(delta):

	$Sprite2D.rotation_degrees += 10
	motion = direction*150 * delta
	collision = move_and_collide(motion)
	get_collision()

func get_collision():
	if collision != null:
		var collider = collision.get_collider()
		var colliderPosition = collision.get_position()
		if collider == tile:
			var cell = tile.local_to_map(colliderPosition+direction)
			tile.erase_cell(0,cell)

			
			

		if collider == player:
			player.attack = true
		direction = direction.bounce(collision.get_normal())
		
		
