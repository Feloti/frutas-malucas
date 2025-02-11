extends Area2D

@onready var spawn_point = $Character
@onready var username_space = $Username

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicGame.play_music_level()
	#inicia a musica que por estar em uma variavel global nao reseta durante leveis e menus
	#if Global.personagem_selecionado != null:
	#	var spawn_point = $Character
	
	#var c = $Character
	#print(c)
	#for child in c.get_children():
	#	print(child)
	
	#Remove nós de antigas chamadas
	if spawn_point.has_node("Player"):
		spawn_point.get_node("Player").queue_free()
	if username_space.has_node("Username"):
		spawn_point.get_node("Username").queue_free()
	
	var character_scene: PackedScene = load(Global.characters[Global.selected_character])
	var character_instance:CharacterBody2D = character_scene.instantiate()
	spawn_point.add_child(character_instance)
	
	#Todo: Estilizar e mudar label para cena própria
	"""
	var label_username = Label.new()
	label_username.text = Global.username
	label_username.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label_username.size = Vector2(40, 23)
	label_username.scale = Vector2(0.3, 0.3)
	label_username.name = "Username"
	
	username_space.add_child(label_username)"""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_map.tscn")
