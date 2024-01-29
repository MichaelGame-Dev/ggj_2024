extends Node2D

@export var joke_array : Array[AudioStreamOggVorbis] = []
## The set of terrian blocks which are currently rendered to viewport
var joke: AudioStreamOggVorbis

@onready var joke_timer = $JokeTimer
@export_dir var jokes_path = "res://jokes/"
@onready var player = %Player
@onready var enemy_spawner = %EnemySpawner

@onready var score = %Score


# Called when the node enters the scene tree for the first time.
func _ready():
	#_load_jokes(jokes_path) # Replace with function body.
	player.player_died.connect(start_game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	enemy_spawner.position.y = player.position.y -400
	score.increase_score(1)



func _load_jokes(target_path: String) -> void:
	var dir = DirAccess.open(target_path)
	for scene_path in dir.get_files():
		joke_array.append(load(target_path + "/" + scene_path))

func _play_joke(joke_file):
	var joke_played = SoundManager.play_joke(joke_file)
	joke_timer.start(30)


	
func _on_joke_timer_timeout():
	joke = joke_array.pick_random()

	_play_joke(joke)
	
func spawn_enemey():
	pass
	
func start_game_over():
	Globals.game_over.emit(score.score)
