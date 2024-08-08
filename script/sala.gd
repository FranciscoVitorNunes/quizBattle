extends Node2D


@export var spriteprof = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	$Level.spriteProf.load_path = spriteprof


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
