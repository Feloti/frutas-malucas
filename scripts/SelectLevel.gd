extends Area2D

var scroll_till_bottom = 160 * 2 #Tamanho da tela vertical * numero de telas extras
@onready var scroll_container: ScrollContainer = $ScrollContainer
var collision_shapes = []

func _ready() -> void:
	# Obtens todos os objetos de colisões dos 'botões' de seleção de niveis
	var levels_parent = $SelectLevels
	for level in levels_parent.get_children():
		var collision = level.get_node("Collision")
		collision_shapes.append({
		"node": collision,
		"original_y": collision.position.y
		})

	# Conecta o sinal de scroll
	var v_scroll = scroll_container.get_v_scroll_bar()
	v_scroll.value_changed.connect(_update_collisions_positions)

func _update_collisions_positions(scroll_value: float) -> void:
	for entry in collision_shapes:
		#Altera a posição do nó de acordo com o valor atual de scroll
		entry.node.position.y = entry["original_y"] + scroll_till_bottom - scroll_value

func _process(delta: float) -> void:
	pass
	
