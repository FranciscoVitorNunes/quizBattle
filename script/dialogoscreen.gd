extends Control
class_name DialogScreen


var transition_instance =  preload("res://scenes/transicao.tscn")
var _steep: float = 0.5
var _id: int = 1
var _idProf: int

var data: Dictionary= {}

const _QUIZ: PackedScene = preload("res://scenes/quiz.tscn")
@export_category("Objects")
@export var _name: Label = null
@export var _dialog: RichTextLabel = null
@export var _faceset: TextureRect = null

func _ready() -> void:
	_initialize_dialog()

	
func _process(delta) -> void:
	if  Input.is_action_pressed("espace") and _dialog.visible_ratio < 1:
		_steep = .01
		return
	_steep = 0.05
	if  Input.is_action_just_pressed("espace"):
		_id += 1
		if _id > data[_idProf]["dialogs"][Globals.dialog_progress[_idProf]].size():

			Globals.is_dialog_open = false
			queue_free()
			return
		_initialize_dialog()
		

func _initialize_dialog() -> void:
	_dialog.text = data[_idProf]["dialogs"][Globals.dialog_progress[_idProf]][_id]
	_faceset.texture = load(data[_idProf]["faceset"][0]["faceset"])

	_dialog.visible_characters =  0
	while _dialog.visible_ratio < 1:
		await  get_tree().create_timer(_steep).timeout
		_dialog.visible_characters += 1


func _on_button_pressed():
	var _new_quiz: CanvasLayer = _QUIZ.instantiate()
	_new_quiz._idProf=_idProf
	_new_quiz.quiz = ResourceLoader.load(data[_idProf]["quizzes"][Globals.dialog_progress[_idProf]])
	$".".add_child(_new_quiz)

	# Conecte o sinal tree_exited para remover o diálogo quando o quiz for encerrado
	_new_quiz.connect("tree_exited", Callable(self, "_on_quiz_closed"))
	
func _on_quiz_closed():
	# Aqui, remova o diálogo da tela
	if Globals.is_dialog_open:
		Globals.is_dialog_open = false
		# Substitua pelo nó correto que contém o diálogo
		$".".queue_free()


func _on_next_dialog_pressed():
	if _dialog.visible_ratio < 1:
		_steep = .01
		return
	else:
		_steep = 0.05
		_id += 1
		if _id > data[_idProf]["dialogs"][Globals.dialog_progress[_idProf]].size():
			transition_instance.instantiate()
			var transition: CanvasLayer = transition_instance.instantiate()
			$".".add_child(transition)
			await get_tree().create_timer(1).timeout
			Globals.quiz_open=true
			var _new_quiz: CanvasLayer = _QUIZ.instantiate()
			_new_quiz._idProf=_idProf
			_new_quiz.quiz = ResourceLoader.load(data[_idProf]["quizzes"][Globals.dialog_progress[_idProf]])
			$".".add_child(_new_quiz)

			# Conecte o sinal tree_exited para remover o diálogo quando o quiz for encerrado
			_new_quiz.connect("tree_exited", Callable(self, "_on_quiz_closed"))
			return
		_initialize_dialog()
		


func _on_quit_pressed() -> void:
	Globals.is_dialog_open = false
	queue_free()
