extends Area2D

@export var nextScene: Vector2
@export var dentroFora: bool

# Variável para armazenar o corpo do jogador quando ele entrar
var player_body: Node = null

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player_body = body  # Armazena o jogador quando ele entra na área
		$interagir.visible = true  # Mostra o botão de interação

func _on_interagir_pressed() -> void:
	if player_body and player_body.is_in_group("player"):  # Verifica se o jogador está presente
		if dentroFora:
			# Se dentroFora for true, teleportar para a posição armazenada
			player_body.position = Globals.entrance_position
		else:
			# Se dentroFora for false, armazenar a posição atual do jogador
			Globals.entrance_position = player_body.position
			# E teleportar para a nova cena
			player_body.position = nextScene
		
		$interagir.visible = false  # Esconde o botão após o teleporte

func _on_body_exited(body: Node) -> void:
	if body == player_body:
		player_body = null  # Limpa a referência ao jogador ao sair da área
		$interagir.visible = false  # Esconde o botão ao sair da área
