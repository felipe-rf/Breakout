extends Node2D

@onready var player = get_parent().get_node("res://character_body_2d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.monitoring = true
func _on_body_entered(body):
	body.get_powerup(1)
	self.queue_free()
