extends ScrollContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_scroll()
	call_deferred("init_scroll")
	
func init_scroll():
	#Move o scroll para o inicio dos niveis 
	#TODO: Calcular a posição com base no ultimo nivel que o jogador parou
	var v_scroll:VScrollBar = get_v_scroll_bar()
	v_scroll.allow_greater = true
	v_scroll.set_value_no_signal(320.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
