extends Node2D
class_name  Level


const _DIALOG_SCREEN: PackedScene = preload("res://scenes/dialogoscreen.tscn")
const _QUIZ: PackedScene = preload("res://scenes/quiz.tscn")
var _dialog_data: Dictionary = {
	0: {
		"faceset": [
			{
			"faceset": "res://sprites/professores/icons/Jhonatan.png"
			}
		],
		"dialogs": [
			{
				1: "Oi Márcia, tudo bem?",
				2: "Sou professora de química",
			},
			{
				1: "Que bom te ver de vouta!",
				2: "Vamos ver se é boa em assuntos de radioatividade",
			}
		],
		"quizzes": [
			"res://resources/theme/tabela.tres",  # Nível 1
			"res://resources/theme/tabela.tres"  # Nível 2
		]
	},
	1: {
		"faceset": [
			{
			"faceset": "res://sprites/professores/icons/ana.png"
			}
		],
		"dialogs": [
			{
				1: "Olá, estudante! me chamo Ana Márcia!",
				2: "Olá, estudante! Pronto para um desafio de física?",
			},
			{
				1: "Olá novamente!",
				2: "Pronto para um desafio de termologia?",
			}
		],
		"quizzes": [
			"res://resources/theme/movimento.tres",  # Nível 1
			"res://resources/theme/movimento.tres"  # Nível 2
		]
	},
	3: {
		"faceset": [
			{
			"faceset": "res://sprites/professores/icons/machi.png"
			}
		],
	"dialogs": [
		{
			1: "Olá, estudante! me chamo Ana Márcia!",
			2: "Olá, estudante! Pronto para um desafio de física?",
		},
		{
			1: "Olá novamente!",
			2: "Pronto para um desafio de termologia?",
		}
	],
	"quizzes": [
		"res://resources/theme/ecologia.tres",  # Nível 1
		"res://resources/theme/ecologia.tres"  # Nível 2
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
