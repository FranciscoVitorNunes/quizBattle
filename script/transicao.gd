extends Node

@onready var fade = $fade/efeitofade

func _ready():
	# Executa o fade in quando a cena é carregada
	fade.play("fadein")
	await get_tree().create_timer(1.7).timeout
	$".".queue_free()
