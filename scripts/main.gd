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
	

	if spawn_point.has_node("Personagem"):  # Verifica por nome
		spawn_point.get_node("Personagem").queue_free()

	# Limpar username anterior
	if username_space.has_node("LabelUsername"):
		username_space.get_node("LabelUsername").queue_free()
		
	# Adiciona o personagem como filho do spawn point
	spawn_point.add_child(Global.personagem_selecionado)
	username_space.add_child(Global.username)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
