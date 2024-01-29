extends Node

var player : Player

signal add_points
signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _game_over(value : int):
	game_over.emit(value)
