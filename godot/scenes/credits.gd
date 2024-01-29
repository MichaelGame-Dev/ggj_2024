extends Control
@onready var main_menu_button = $MarginContainer/PanelContainer/VBoxContainer/MainMenuButton

@export var main_menu_scene : PackedScene

# Called when the node enters the scene tree for the first time.



func _ready():

	
	

	main_menu_scene.grab_focus()





func _on_rich_text_label_meta_clicked(meta):
	OS.shell_open(str(meta))


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu_scene.tscn")
