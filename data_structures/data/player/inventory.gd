class_name Inventory
extends Node

var inventory: Dictionary = {}

func update_item(item, amount) -> void:
	if inventory.has(item):
		inventory[item] += amount	##Updates the amount of existing item, may clash with the "create_material()" function
	else:
		inventory[item] = amount	##Adds item to inventory
	
	if inventory[item] <= 0:
		inventory.erase(item)		##Removes item from inventory when it's 0
