extends Area2D

@onready var scroll_container: ScrollContainer = $ScrollContainer

var open_levels = 10 - Global.higher_level_completed + 1 #10 = Quantidade de niveis
var scroll_till_bottom = 160 * 2 #Tamanho da tela vertical * numero de telas extras
var sprite_leaf = load("res://sprites/Others/fallen_leaves.png")
var collision_shapes = []
var node_leaves = []

func _ready() -> void:
	# Obtens todos os objetos de colisões dos 'botões' de seleção de niveis
	var levels_parent = $SelectLevels
	for level in levels_parent.get_children():
		var collision = level.get_node("Collision")
		collision_shapes.append({
		"node": collision,
		"original_x": collision.position.x,
		"original_y": collision.position.y
		})
	
	create_leaves_sprites(open_levels)
	
	# Conecta o sinal de scroll
	var v_scroll = scroll_container.get_v_scroll_bar()
	v_scroll.value_changed.connect(_update_collisions_positions)

func _update_collisions_positions(scroll_value: float) -> void:
	var i = -Global.higher_level_completed
	for entry in collision_shapes:
		#Altera a posição do nó de acordo com o valor atual de scroll
		entry.node.position.y = entry["original_y"] + scroll_till_bottom - scroll_value
		node_leaves[i].position.y = entry["original_y"] + scroll_till_bottom - scroll_value
		i += 1

func _process(delta: float) -> void:
	pass
	
func create_leaves_sprites(levels_count: int):
	for i in range(Global.higher_level_completed, open_levels):
		var leaf:Sprite2D = Sprite2D.new()
		var leaf_x:float = collision_shapes[i]["original_x"]
		var leaf_y:float = collision_shapes[i]["original_y"]
		
		leaf.texture = sprite_leaf
		leaf.scale = Vector2(0.06, 0.06)
		leaf.position = Vector2(leaf_x, leaf_y)
		collision_shapes[i]["node"].disabled = true
		
		add_child(leaf)
		node_leaves.append(leaf) 
