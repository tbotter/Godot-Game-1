extends Control

##Reference to the data object
var data : Data = Game.ref.data

func _ready() -> void:
	(%SelectMinionContainer as Container).visible = false
	(%MinionStatsContainer as Container).visible = false
	(%CloseInfoContainer as Button).pressed.connect(_toggle_SelectMinionContainer)
	(%CloseStats as Button).pressed.connect(_toggle_statscontainer)
	(%InfoMinion as Button).pressed.connect(_toggle_statscontainer)
	#((get_node("MarginContainer/MainMinionContainer/ID0") as Button).pressed.connect(_toggle_SelectMinionContainer))
	for i in range(48):
		(get_node("MarginContainer/MainMinionContainer/ID"+str(i)) as Button).pressed.connect(_toggle_SelectMinionContainer)
	for j in range(5, 48):
		(get_node("MarginContainer/MainMinionContainer/ID"+str(j)) as Button).disabled = true
		(get_node("MarginContainer/MainMinionContainer/ID"+str(j)) as Button).text = "LOCKED"
	

func _toggle_SelectMinionContainer() -> void:
	if (%SelectMinionContainer as Container).visible == false:
		(%SelectMinionContainer as Container).visible = true
		return
		
	if (%SelectMinionContainer as Container).visible == true:
		(%SelectMinionContainer as Container).visible = false
		return

func _toggle_statscontainer() -> void:
	if (%MinionStatsContainer as Container).visible == false:
		(%MinionStatsContainer as Container).visible = true
		return
		
	if (%MinionStatsContainer as Container).visible == true:
		(%MinionStatsContainer as Container).visible = false
		return
