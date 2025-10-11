class_name Items
extends Resource


@export var materials : Dictionary[String, Item]
@export var equipables: Dictionary[String, Equipable]

func _init() -> void:
	for file_name in DirAccess.get_files_at("res://resources/items/materials/"):
		var item = ResourceLoader.load("res://resources/items/materials/" + file_name) as Item
		materials[item.name] = item
	
	for file_name in DirAccess.get_files_at("res://resources/items/equipable/"):
		var equipable = ResourceLoader.load("res://resources/items/equipable/" + file_name) as Equipable
		equipables[equipable.name] = equipable
