extends Area2D

@export var nextScene: Vector2
@export var dentroFora: bool
var transition_instance =  preload("res://scenes/transicao.tscn")
var event: InputEvent
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
				# Espera 8 segundos
				transition_instance.instantiate()
				var transition: CanvasLayer = transition_instance.instantiate()
				$".".add_child(transition)
				await get_tree().create_timer(1).timeout
				player_body.position = Globals.entrance_position
			else:
				# Se dentroFora for false, armazenar a posição atual do jogador
				Globals.entrance_position = player_body.position
				transition_instance.instantiate()
				var transition: CanvasLayer = transition_instance.instantiate()
				$".".add_child(transition)
				await get_tree().create_timer(1).timeout
				# E teleportar para a nova cena
				player_body.position = nextScene
			
			$interagir.visible = false  # Esconde o botão após o teleporte

func _on_body_exited(body: Node) -> void:
	if body == player_body:
		player_body = null  # Limpa a referência ao jogador ao sair da área
		$interagir.visible = false  # Esconde o botão ao sair da área
