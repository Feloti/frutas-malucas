extends Control


func _ready() -> void:
	MusicGame.play_music_level()
	#inicia a musica que por estar em uma variavel global nao reseta durante leveis e menus
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/input_username.tscn")

func _on_options_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
