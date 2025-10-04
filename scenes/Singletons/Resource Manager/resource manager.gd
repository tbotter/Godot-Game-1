class_name ResourceManager
extends Node

static var ref : ResourceManager

func _init() -> void:
	if not ref : ref = self
	else : queue_free()


signal resource_updated

var data : Data = Game.ref.data

func get_resource(name : String) -> int: 
	return data.items.inventory[name].amount

func create_resource(name : String, quantity : int) -> Error :
	if quantity <= 0 : return FAILED
	
	resource_updated.emit()
	data.items.inventory[name].amount += quantity
	return OK

func consume_resource(name : String, quantity : int) -> Error :
	if quantity < 0 : return FAILED
	
	if quantity > data.items.inventory[name].amount : return FAILED ##If not enough resources, return
	
	resource_updated.emit()
	data.items.inventory[name].amount -= quantity
	return OK
