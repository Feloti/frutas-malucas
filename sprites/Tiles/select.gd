extends Area2D

func _ready():
	for child in get_children():
		child.input_event.connect(_on_character_clicked.bind(int(str(child.name))))

func _on_character_clicked(viewport, event, shape_idx, character_id):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Global.selected_character = character_id
			get_tree().change_scene_to_file("res://scenes/level_map.tscn")
