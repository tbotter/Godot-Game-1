class_name Generator
extends Node


static var ref : Generator

func _init() -> void :
	if not ref: ref = self
	else: queue_free()


## Todo: Turn this into an array
## var generators : [
##  					["Cobblestone", ##Name of Generator
##						24.0,			##Cycle duration in seconds
##						0.0,			##Cycle progression in seconds
##						1]				##Amount produced
##					]
var _active_generators : int = 1
var _cycle_duration : float = 24.0
var _cycle_progression : float = 0.0
var _production : int = 1

var _paused : bool = true

func _ready() -> void:
	Clock.ref.ticked.connect(_progress_cycle)
	_paused = not Game.ref.data.progression.minions_unlocked ##Generator off when not unlocked

func _progress_cycle() -> void :
	if _paused : return
	
	_cycle_progression += (1.0 * _active_generators)
	if _cycle_progression >= _cycle_duration :
		_generate()

func _generate() -> void :
	_cycle_progression -= _cycle_duration
	Game.ref.data.resources.inventory[1][1] += _production
