extends Control

func _ready() -> void:
	MusicGame.play_music_level()

func _on_config_button_pressed() -> void:
	pass

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/selection.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
