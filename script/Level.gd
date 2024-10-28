extends Node2D
class_name  Level


const _DIALOG_SCREEN: PackedScene = preload("res://scenes/dialogoscreen.tscn")
const _QUIZ: PackedScene = preload("res://scenes/quiz.tscn")
var _dialog_data: Dictionary = {
	3: {
		"texture": [
			{
				"path": "res://sprites/professores/machi.png"
			}
		],
		"faceset": [
			{
				"faceset": "res://sprites/professores/icons/machi.png"
			}
		],
		"dialogs": [
			{
				1: "Todo ser vivo tem algo em comum, sabia?",
				2: "Crescem, se reproduzem, respondem ao ambiente!",
				3: "Preparado para testar seu conhecimento sobre a vida?"
			},
			{
				1: "Como a vida começou? Muitos cientistas se perguntam!",
				2: "Teorias sugerem que viemos de moléculas simples.",
				3: "Vamos ver o que você sabe sobre isso? Hora do quiz!"
			},
			{
				1: "As células são as menores unidades da vida!",
				2: "São tipo fábricas que fazem de tudo um pouco!",
				3: "Preparado pra explorar o mundo celular? Vem pro quiz!"
			},
			{
				1: "Água, proteínas e lipídios - o que nos mantém vivos!",
				2: "Essas moléculas têm funções únicas no nosso corpo.",
				3: "Quer saber mais sobre essas moléculas? Bora pro quiz!"
			},
			{
				1: "Nosso corpo carrega um código, o DNA!",
				2: "Ele diz quem somos e o que podemos herdar.",
				3: "Pronto para desvendar o código da vida? Vamos ao quiz!"
			},
			{
				1: "Sabia que a célula come, respira e até faz 'energia'?",
				2: "Respiração e fotossíntese são parte do metabolismo.",
				3: "Curioso sobre como as células trabalham? Quiz na tela!"
			},
			{
				1: "Cada ser vivo tem seu papel no ecossistema.",
				2: "Há uma cadeia, e todos são essenciais nela!",
				3: "Pronto pra explorar o equilíbrio da natureza? Vamos lá!"
			},
			{
				1: "Tudo é organizado em reinos, gêneros e espécies!",
				2: "Classificar ajuda a entender melhor os seres vivos.",
				3: "Vamos ver como está seu conhecimento? Quiz à vista!"
			},
			{
				1: "Bactérias, fungos e vírus - nossos invisíveis vizinhos!",
				2: "Alguns nos ajudam, outros... nem tanto.",
				3: "Preparado para entrar no mundo dos micro-organismos?"
			},
			{
				1: "Da planta ao fungo, todos pertencem a um reino!",
				2: "Cada reino tem seres únicos com funções vitais.",
				3: "Quer saber mais sobre os reinos? Vem pro quiz!"
			}
		],
		"quizzes": [
			"res://resources/theme/bio1.tres",  # Nível 1
			"res://resources/theme/bio2.tres"   # Nível 2
		]
	},
	0: {
		"texture": [
			{
				"path": "res://sprites/professores/Jhonatan.png"
			}
		],
		"faceset": [
			{
				"faceset": "res://sprites/professores/icons/Jhonatan.png"
			}
		],
		"dialogs": [
			{
				1: "Tudo ao nosso redor é feito de matéria!",
				2: "E a matéria tem formas e propriedades únicas!",
				3: "Vamos ver o que você sabe sobre a matéria?"
			},
			{
				1: "Imagine o átomo, uma pequena maravilha invisível.",
				2: "Ele tem prótons, nêutrons e elétrons, sabia?",
				3: "Curioso para explorar o átomo? Vamos pro quiz!"
			},
			{
				1: "A tabela periódica é tipo o alfabeto da química!",
				2: "Cada elemento tem seu lugar e comportamento.",
				3: "Preparado para mergulhar na tabela? Quiz à frente!"
			},
			{
				1: "Átomos se ligam para formar substâncias!",
				2: "Ligação iônica, covalente ou metálica - qual será?",
				3: "Pronto para aprender sobre as ligações? Vamos lá!"
			},
			{
				1: "Misturou, mudou e... ocorreu uma reação!",
				2: "É como mágica, mas totalmente explicável.",
				3: "Pronto para entender as reações químicas? Hora do quiz!"
			},
			{
				1: "Cálculos em química? Sim, isso é estequiometria!",
				2: "Quantidades exatas fazem tudo funcionar bem.",
				3: "Pronto para calcular? Teste sua química no quiz!"
			},
			{
				1: "Ácidos, bases, sais - químicos poderosos!",
				2: "Cada um tem suas propriedades e usos únicos.",
				3: "Quer saber o que eles fazem? É hora do quiz!"
			},
			{
				1: "Os átomos foram um mistério por muitos séculos!",
				2: "Vários cientistas tentaram entender sua estrutura.",
				3: "Vamos explorar os modelos? Preparado pro quiz?"
			},
			{
				1: "Sabia que a química estuda a poluição também?",
				2: "É importante entender pra cuidar do meio ambiente.",
				3: "Pronto para salvar o planeta? Quiz a seguir!"
			},
			{
				1: "Água com sal é uma solução, sabia?",
				2: "As soluções são comuns e estão em todo lugar!",
				3: "Curioso sobre como funcionam? Vamos pro quiz!"
			}
		],
		"quizzes": [
			"res://resources/theme/qui2.tres",  # Nível 1
			"res://resources/theme/qui1.tres"   # Nível 2
		]
	},
	1: {
		"texture": [
			{
				"path": "res://sprites/professores/ana.png"
			}
		],
		"faceset": [
			{
				"faceset": "res://sprites/professores/icons/ana.png"
			}
		],
		"dialogs": [
			{
				1: "Tudo no universo é feito de matéria!",
				2: "E ocupa um espaço... com o tempo sempre passando.",
				3: "Pronto pra explorar o básico da física? Quiz aí!"
			},
			{
				1: "Na física, tudo é medido e tem unidades próprias!",
				2: "Isso ajuda a entender o mundo de forma precisa.",
				3: "Vamos ver como você vai nas medições? Hora do quiz!"
			},
			{
				1: "Velocidade e movimento! Sabia que há regras?",
				2: "MRU e MRUV são só alguns tipos de movimento.",
				3: "Quer ver como se movimenta? Hora do quiz!"
			},
			{
				1: "Força, inércia e ação - Newton sabia das coisas!",
				2: "Essas leis explicam muita coisa no dia a dia!",
				3: "Preparado pra ver a física em ação? Vem pro quiz!"
			},
			{
				1: "Trabalho gera energia, e a potência faz diferença!",
				2: "Tudo que fazemos envolve esses conceitos.",
				3: "Quer aprender mais sobre energia? Vamos ao quiz!"
			},
			{
				1: "Por que não flutuamos? É a gravidade, claro!",
				2: "E Newton descobriu que ela é uma força universal!",
				3: "Vamos ver o que você sabe sobre gravidade?"
			},
			{
				1: "Pressão e densidade explicam o que flutua ou afunda!",
				2: "Tem a ver com a força dos líquidos, sabia?",
				3: "Quer mergulhar nesse tema? Quiz na área!"
			},
			{
				1: "Calor é energia, e temperatura é o grau de agitação!",
				2: "Isso explica as mudanças nos estados da matéria.",
				3: "Vamos ver o que você sabe sobre calor? Vamos ao quiz!"
			},
			{
				1: "A eletricidade está em todo lugar!",
				2: "Ela começa com cargas e termina em corrente.",
				3: "Pronto pra acender o conhecimento? Hora do quiz!"
			},
			{
				1: "Reflexão e refração criam as imagens que vemos!",
				2: "É a base do que chamamos de ótica!",
				3: "Preparado para explorar a luz? Quiz pronto pra você!"
			}
		],
		"quizzes": [
			"res://resources/theme/fis1.tres",  # Nível 1
			"res://resources/theme/fis2.tres"   # Nível 2
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
	if body is Player:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_new_dialog.z_index = 0
		_new_dialog._idProf=idProf
		_hud.add_child(_new_dialog)
		Globals.is_dialog_open = true
	
