extends Control

@onready var score_label = $MarginContainer/PanelContainer/VBoxContainer/ScoreLabel
@onready var main_menu_button = $MarginContainer/PanelContainer/VBoxContainer/MainMenuButton
@export var main_menu_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.game_over.connect(show_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func show_score(value : int):
	var score_string : String = "Score: "+ str(value)
	score_label.text = score_string


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_packed(main_menu_scene)
