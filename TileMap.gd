extends TileMap

@onready var bum = $"../RigidBody2D"
@onready var brick = preload('res://brick.tscn')
var pos: Vector2i
# Called when the node enters the scene tree for the first time.
func _ready():
	#for i in get_used_cells_by_id(0,1,Vector2(0,0)):
	#	var inst = brick.instantiate()
	#	add_child(inst)
		#set_cell(0,i,-1)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_cell(0,pos,-1)
