class_name ResourceManager
extends Node

static var ref : ResourceManager

func _init() -> void:
	if not ref : ref = self
	else : queue_free()


signal resource_updated

var data : Data = Game.ref.data

func get_resource(material : String) -> int: 
	return data.items.inventory[material].amount

func create_resource(material : String, quantity : int) -> Error :
	if quantity <= 0 : return FAILED
	
	resource_updated.emit()
	data.items.inventory[material].amount += quantity
	return OK

func consume_resource(material : String, quantity : int) -> Error :
	if quantity < 0 : return FAILED
	
	if quantity > data.items.inventory[material].amount : return FAILED ##If not enough resources, return
	
	resource_updated.emit()
	data.items.inventory[material].amount -= quantity
	return OK
