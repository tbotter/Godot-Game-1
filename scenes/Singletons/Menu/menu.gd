extends Control

var current_screen : String = ""

func _ready() -> void:
	current_screen = "None" #Just for this Menu!
	(%ReturnToMenu as Button).pressed.connect(return_to_menu)
	(%ExitButton as Button).pressed.connect(exit_menu)
	(%PlayerStats as Button).pressed.connect(open_menu.bind("PlayerStats"))
	(%Skills as Button).pressed.connect(open_menu.bind("Skills"))
	(%Collection as Button).pressed.connect(open_menu.bind("Collection"))
	(%Recipes as Button).pressed.connect(open_menu.bind("Recipes"))
	(%Pets as Button).pressed.connect(open_menu.bind("Pets"))
	(%Wardrobe as Button).pressed.connect(open_menu.bind("Wardrobe"))
	(%Sacks as Button).pressed.connect(open_menu.bind("Sacks"))
	(%MenuLabel as Label).text = "Main Menu"
	(%SkillsPanel as PanelContainer).visible = false
	(%CollectionPanel as PanelContainer).visible = false

func open_menu(menu : String = "") -> void:
	match menu: ##match = switch case
		"PlayerStats": ##No space here because it gets the Button's name instead of the MenuLabel
			current_screen = "Player Stats"
			(%MenuLabel as Label).text = current_screen
			##(%PlayerStatsMenu as Label).visible = true
		"Skills":
			current_screen = "Skills"
			(%MenuLabel as Label).text = current_screen
			(%SkillsPanel as PanelContainer).visible = true
		"Collection":
			current_screen = "Collection"
			(%MenuLabel as Label).text = current_screen
			(%CollectionPanel as PanelContainer).visible = true
		"Recipes":
			current_screen = "Recipes"
			##(%MenuLabel as Label).text = current_screen
			##(%RecipesMenu as HBoxContainer).visible = true
		"Pets":
			current_screen = "Pets"
			##(%MenuLabel as Label).text = current_screen
			##(%PetsMenu as HBoxContainer).visible = true
		"Wardrobe":
			current_screen = "Wardrobe"
			##(%MenuLabel as Label).text = current_screen
			##(%WardrobeMenu as HBoxContainer).visible = true
		"Sacks":
			current_screen = "Sacks"
			##(%SacksMenu as HBoxContainer).visible = true
		_:  ##<--- This underscore is Godot's switch case "default" lol
			return

func exit_menu() -> void:
	current_screen = "None"
	(%MenuLabel as Label).text = "Main Menu"
	(%SkillsPanel as PanelContainer).visible = false
	(%CollectionPanel as PanelContainer).visible = false
	((get_node("/root/Game/Skydle Menu")) as MarginContainer).visible = false
	pass

func return_to_menu() -> void:
	match current_screen:
		"Player Stats": ##Space here needed because it's the MenuLabel
			current_screen = "None"
			(%MenuLabel as Label).text = "Main Menu"
			##(%PlayerStatsMenu as Label).visible = false
		"Skills":
			current_screen = "None"
			(%MenuLabel as Label).text = "Main Menu"
			(%SkillsPanel as PanelContainer).visible = false
		"Collection":
			current_screen = "None"
			(%MenuLabel as Label).text = "Main Menu"
			(%CollectionPanel as PanelContainer).visible = false
		"Recipes":
			current_screen = "None"
			(%MenuLabel as Label).text = "Main Menu"
			##(%RecipesMenu as HBoxContainer).visible = false
		"Pets":
			current_screen = "None"
			(%MenuLabel as Label).text = "Main Menu"
			##(%PetsMenu as HBoxContainer).visible = false
		"Wardrobe":
			current_screen = "None"
			(%MenuLabel as Label).text = "Main Menu"
			##(%WardrobeMenu as HBoxContainer).visible = false
		"Sacks":
			current_screen = "None"
			(%MenuLabel as Label).text = "Main Menu"
			##(%SacksMenu as HBoxContainer).visible = false
		_:
			return
	pass
