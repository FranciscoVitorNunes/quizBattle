extends Node2D
class_name  Level


const _DIALOG_SCREEN: PackedScene = preload("res://scenes/dialogoscreen.tscn")
const _QUIZ: PackedScene = preload("res://scenes/quiz.tscn")
var _dialog_data: Dictionary = {
	0: {
		"dialogs": [
			{
				"faceset": "res://sprites/professores/icons/Jhonatan.png",
				"dialog": "Oi Márcia, tudo bem?",
				"title": "machi",
			},
			{
				"faceset": "res://sprites/professores/icons/Jhonatan.png",
				"dialog": "Sou professora de química",
				"title": "jona",
			}
		],
		"quizzes": [
			"res://quizzes/quiz_periodic_table.tres",  # Nível 1
			"res://quizzes/quiz_chemical_reactions.tres"  # Nível 2
		]
	},
	1: {
		"dialogs": [
			{
				"faceset": "res://sprites/professores/icons/ana.png",
				"dialog": "Olá, estudante! Pronto para um desafio de física?",
				"title": "física",
			},
			{
				"faceset": "res://sprites/professores/icons/ana.png",
				"dialog": "Vamos falar sobre leis de Newton.",
				"title": "leis de Newton",
			}
		],
		"quizzes": [
			"res://quizzes/quiz_newton_laws.tres",  # Nível 1
			"res://quizzes/quiz_energy_conservation.tres"  # Nível 2
		]
	},
	3: {
	"dialogs": [
		{
			"faceset": "res://sprites/professores/icons/machi.png",
			"dialog": "Olá, estudante! Pronto para um desafio de biologia?",
			"title": "biologia",
		},
		{
			"faceset": "res://sprites/professores/icons/machi.png",
			"dialog": "Vamos falar sobre ecologia.",
			"title": "ecologia",
		}
	],
	"quizzes": [
		"res://quizzes/quiz_newton_laws.tres",  # Nível 1
		"res://quizzes/quiz_energy_conservation.tres"  # Nível 2
	]
}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null
@export var spriteProf: Texture2D 
@export var idProf: int

func _ready() -> void:
	$Sprite2D.texture = spriteProf



func _on_area_2d_body_entered(body) -> void:
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_data
	_new_dialog.z_index = 0
	_new_dialog._idProf=idProf
	_hud.add_child(_new_dialog)
	Globals.is_dialog_open = true
