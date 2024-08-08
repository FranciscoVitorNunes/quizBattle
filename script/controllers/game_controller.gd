extends Node


@export var quiz: QuizTheme
@export var color_right: Color
@export var color_wrong: Color

var buttons: Array[Button]
var index: int = 0
var correct: int = 0

@onready var label = $Control/VBoxContainer/Label

func _ready():
	
	correct = 0 
	for button in $Control/VBoxContainer2.get_children():
		buttons.append(button)
		
	_random_array(quiz.theme)
	
	
	load_quiz()

func load_quiz() -> void:
	if index >= quiz.theme.size():
		_game_over()
		return
		
	label.text = quiz.theme[index].question_info
	
	var opitions =  _random_array(quiz.theme[index].options)
	

	for i in buttons.size():
		buttons[i].text = opitions[i]
		buttons[i].pressed.connect(_button_answer.bind(buttons[i]))
		
func _button_answer(button) -> void:
	if quiz.theme[index].currect == button.text:
		button.modulate = color_right
		correct += 1
	else:
		button.modulate = color_wrong
	
	_next_question()

func _next_question() -> void:
	for bt in buttons:
		bt.pressed.disconnect(_button_answer)
	
	await  get_tree().create_timer(1).timeout
	
	for bt in buttons:
		bt.modulate = Color.WHITE
	
	index += 1
	
	load_quiz()

func _random_array(array: Array) -> Array:
	var array_temp = array
	array_temp.shuffle()
	return array_temp

func _game_over() -> void:
	$Control/GameOver.show()
	$Control/GameOver/Score.text = str(correct, "/", quiz.theme.size())


func _on_restart_pressed():
	
	queue_free()

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
