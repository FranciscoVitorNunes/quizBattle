extends Node

var is_dialog_open = false
var quiz_open = false
# Armazena o progresso do diálogo para cada professor
var dialog_progress = {
	0: 0,  # Progresso do professor 1
	1: 0,  # Progresso do professor 2
	2: 0,   # Progresso do professor 3
	3: 0   # Progresso do professor 3
}
# Variável global para armazenar a posição de entrada
var entrance_position: Vector2 = Vector2(0, 0)
