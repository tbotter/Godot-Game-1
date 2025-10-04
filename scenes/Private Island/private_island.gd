class_name PrivateIsland
extends Control

##Reference to the data object
var data : Data = Game.ref.data

const oak_COST : int = 32 ##For unlocking Cobblestone button
var minions_visible : bool = false


func _ready() -> void:
	update_label()
	(%PIOakButton as Button).pressed.connect(_oak_button_pressed)
	(%LockedCobblestoneButton as Button).pressed.connect(_unlock_cobble)
	(%PICobblestoneButton as Button).pressed.connect(_cobble_button_pressed)
	(%ShowMinionArea as Button).pressed.connect(_toggle_minion_area)
	(%HideMinionArea as Button).pressed.connect(_toggle_minion_area)
	(%MinionAreaContainer as Container).visible = false
	Clock.ref.ticked.connect(update_label)

func _unlock_cobble() -> void:
	if Game.ref.data.resources.inventory[0][1] >= oak_COST:
		Game.ref.data.resources.inventory[0][1] -= oak_COST
		(%LockedCobblestoneButton as Button).visible = false
		(%PICobblestoneButton as Button).visible = true
		update_label()
		Game.ref.data.progression.cobble_unlocked = true
	else : return

func _oak_button_pressed() -> void:
	ResourceManager.ref.create_resource(0, 100) ## 0 = Oakwood, 1 = Amount
	update_label()
func _cobble_button_pressed() -> void:
	ResourceManager.ref.create_resource(1, 100) ## 1 = Cobblestone, 1 = Amount
	update_label()

func _toggle_minion_area() -> void:
	if minions_visible == false:
		(%MinionAreaContainer as Container).visible = true
		(%ShowMinionArea as Button).visible = false
		minions_visible = true
	else:
		(%MinionAreaContainer as Container).visible = false
		(get_node("/root/Game/TabContainer/Private Island/MarginContainer/Island/MinionAreaContainer/Minion Area/MarginContainer/SelectMinionContainer") as Container).visible = false
		(get_node("/root/Game/TabContainer/Private Island/MarginContainer/Island/MinionAreaContainer/Minion Area/MarginContainer/MinionStatsContainer") as Container).visible = false
		(%ShowMinionArea as Button).visible = true
		minions_visible = false

func update_label() -> void:
	(%OakLogsLabel as Label).text = "Oak Logs: %s" %ResourceManager.ref.get_resource(0)
	(%CobblestoneLabel as Label).text = "Cobblestone: %s" %ResourceManager.ref.get_resource(1)
