class_name ResourceManager
extends Node

static var ref : ResourceManager

func _init() -> void:
	if not ref : ref = self
	else : queue_free()


signal resource_updated

var data : Data = Game.ref.data

func get_resource(index : int) -> int : ##Index 0 = Oakwood, Index 1 = Cobblestone, etc
	return data.resources.inventory[index][1]

func create_resource(index : int, quantity : int) -> Error :
	if quantity <= 0 : return FAILED
	
	resource_updated.emit()
	data.resources.inventory[index][1] += quantity
	return OK

func consume_resource(index : int, quantity : int) -> Error :
	if quantity < 0 : return FAILED
	
	if quantity > data.resources.inventory[index][1] : return FAILED ##If not enough resources, return
	
	resource_updated.emit()
	data.resources.inventory[index][1] -= quantity
	return OK
