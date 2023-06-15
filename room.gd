extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.gameOver:
		$Label.visible = true
		$Label/Button.disabled = false
	$Pontos.text = "Pontos: " + str(Globals.points)
	$Vidas.text = "Vidas: " + str(Globals.lives)


func _on_button_pressed():
	Globals.lives = 3
	Globals.points = 0
	Globals.gameOver = false
	get_tree().reload_current_scene()
