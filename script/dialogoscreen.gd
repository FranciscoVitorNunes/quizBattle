extends Control
class_name DialogScreen

signal dialog_opened
signal dialog_closed


var _steep: float = 0.5

var _id: int = 0

var data: Dictionary= {}

const _QUIZ: PackedScene = preload("res://scenes/quiz.tscn")
@export_category("Objects")
@export var _name: Label = null
@export var _dialog: RichTextLabel = null
@export var _faceset: TextureRect = null

func _ready() -> void:
	emit_signal("dialog_opened")
	_initialize_dialog()

	
func _process(delta) -> void:
	if  Input.is_action_pressed("espace") and _dialog.visible_ratio < 1:
		_steep = .01
		return
	_steep = 0.05
	if  Input.is_action_just_pressed("espace"):
		_id += 1
		if _id == data.size():
			Globals.is_dialog_open = false
			queue_free()
			return
		_initialize_dialog()
		

func _initialize_dialog() -> void:
	_dialog.text = data[_id]["dialog"]
	_faceset.texture = load(data[_id]["faceset"])

	_dialog.visible_characters =  0
	while _dialog.visible_ratio < 1:
		await  get_tree().create_timer(_steep).timeout
		_dialog.visible_characters += 1


func _on_button_pressed():
	var _new_quiz: CanvasLayer = _QUIZ.instantiate()
	$".".add_child(_new_quiz)


func _on_next_dialog_pressed():
	if _dialog.visible_ratio < 1:
		_steep = .01
		return
	else:
		_steep = 0.05
		_id += 1
		if _id == data.size():
			Globals.is_dialog_open = false
			queue_free()
			return
		_initialize_dialog()
		


func _on_quit_pressed() -> void:
	Globals.is_dialog_open = false
	queue_free()
