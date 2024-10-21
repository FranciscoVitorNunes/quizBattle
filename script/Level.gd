extends Node2D
class_name  Level


const _DIALOG_SCREEN: PackedScene = preload("res://scenes/dialogoscreen.tscn")
const _QUIZ: PackedScene = preload("res://scenes/quiz.tscn")
var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://sprites/professores/icons/Jhonatan.png",
		"dialog": "Oi Márcia, tudo bem?",
		"title": "machi",
	},
	1: {
		"faceset": "res://sprites/professores/icons/Jhonatan.png",
		"dialog": "Sou professora de química",
		"title": "jona",
	},
	2: {
		"faceset": "res://sprites/professores/icons/Jhonatan.png",
		"dialog": "O que voçê sabe sobre tabela periodica?",
		"title": "ana",
	}
}
@export_category("Objects")
@export var _hud: CanvasLayer = null
@export var spriteProf: Texture2D 


func _ready() -> void:
	$Sprite2D.texture = spriteProf



func _on_area_2d_body_entered(body):
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_data
	_new_dialog.z_index = 0
	_hud.add_child(_new_dialog)
	Globals.is_dialog_open = true
