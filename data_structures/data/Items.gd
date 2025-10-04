class_name Items
extends Resource


@export var inventory : Dictionary[String, Item]

func _init() -> void:
	for file_name in DirAccess.get_files_at("res://resources/items/materials/"):
		var item = ResourceLoader.load("res://resources/items/materials/" + file_name) as Item
		inventory[item.name] = item
