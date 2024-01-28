extends Control
var score : int = 0
@onready var score_label = $ScoreLabel



# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.add_points.connect(increase_score) # Replace with function body.


func increase_score(amount : int):
	score += amount
	update_score()
	
func update_score():
	var score_string : String = "Score: " + str(score)

	score_label.text = score_string
