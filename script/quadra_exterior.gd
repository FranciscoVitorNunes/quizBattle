extends Node2D
var current_music_index: int = 0
# Lista de nós de áudio
@onready var musics = [
	$CanvasLayer/alterarMusica/ambiente1,
	$CanvasLayer/alterarMusica/ambiente2,
	$CanvasLayer/alterarMusica/ambiente3
]

func _ready() -> void:
	# Tocar a nova música
	musics[current_music_index].play()
	_on_alterar_musica_pressed()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Função chamada quando o botão é pressionado
func _on_alterar_musica_pressed() -> void:
	# Parar a música atual
	musics[current_music_index].stop()
	
	# Atualizar o índice da música atual, ciclando pelos 7 áudios
	current_music_index += 1
	if current_music_index >= musics.size():
		current_music_index = 0
	
	# Tocar a nova música
	musics[current_music_index].play()
