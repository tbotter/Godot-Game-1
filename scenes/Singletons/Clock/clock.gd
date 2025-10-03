class_name Clock
extends Node


static var ref : Clock

func _init() -> void :
	if not ref: ref = self
	else: queue_free()

signal ticked

##Time necessary for a tick to occur (1.0 = 1 second)
var _tick_duration : float = 1.0
var _tick_progression : float = 0.0

func _process(delta: float) -> void:
	_tick_progression += delta
	if _tick_progression >= _tick_duration :
		_tick()

func _tick() -> void :
	_tick_progression -= _tick_duration
	ticked.emit()
