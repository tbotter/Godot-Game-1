class_name Game
extends Node

static var ref: Game

func _init() -> void:
	if not ref : ref = self
	else: queue_free()

##Main data object of the game
var data : Data = Data.new()
