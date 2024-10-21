extends Control

const _QUIZ: PackedScene = preload("res://scenes/quiz.tscn")
# Called when the node enters the scene tree for the first time.

func _on_button_pressed() -> void:
	var _new_quiz: CanvasLayer = _QUIZ.instantiate()
	$".".add_child(_new_quiz)
