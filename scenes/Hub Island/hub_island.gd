class_name HubIsland
extends Control

const OakCost = 128
const CobbleCost = 64

func _ready() -> void :
	##Game -> Data -> Progression
	if Game.ref.data.progression.hub_unlocked :
		_display_view(true)
	else:
		_display_view(false)
		(%Button as Button).pressed.connect(_unlock_hub)

func _unlock_hub() -> void :
	if Game.ref.data.progression.hub_unlocked :
		return
	
	if ResourceManager.ref.get_resource("Oak Wood") >= OakCost && ResourceManager.ref.get_resource("Cobblestone") >= CobbleCost :
		ResourceManager.ref.consume_resource("Oak Wood", OakCost)
		ResourceManager.ref.consume_resource("Cobblestone", CobbleCost)
		
		Game.ref.data.progression.hub_unlocked = true
		_display_view(true)
	else : 
		return

##Locked or Unlocked view?
func _display_view(unlocked : bool = false) -> void:
	($TabContainer as TabContainer).current_tab = int(unlocked)
