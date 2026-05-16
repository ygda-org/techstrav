extends Control

var selected = ''

var sprites = {
	'ground' : preload("res://UI/Place/GroundSprite.tscn"),
	'player': preload("res://UI/Place/PlayerSprite.tscn"),
	'enemy': preload("res://UI/Place/EnemySprite.tscn"),
	'platform' : preload("res://UI/Place/PlatformSprite.tscn"),
	'goal' : preload('res://UI/Place/GoalSprite.tscn')
}

var addStack = []

var mouse_button_pressed = false

func _ready():
	for l in Locations.grounds:
		var object = sprites["ground"]
		var obj = object.instance()
		obj.position = l
		$Placed.add_child(obj)
	for l in Locations.players:
		var object = sprites["player"]
		var obj = object.instance()
		obj.position = l
		$Placed.add_child(obj)
	for l in Locations.platforms:
		var object = sprites["platform"]
		var obj = object.instance()
		obj.position = l
		$Placed.add_child(obj)
	for l in Locations.enemies:
		var object = sprites["enemy"]
		var obj = object.instance()
		obj.position = l
		$Placed.add_child(obj)
	for l in Locations.goals:
		var object = sprites["goal"]
		var obj = object.instance()
		obj.position = l
		$Placed.add_child(obj)
	
	
func placeObject(pos):
	if not selected == '' and not(selected == 'player' and len(Locations.players) != 0):
		var object = sprites[selected]
		var obj = object.instance()
		obj.position = pos
		$Placed.add_child(obj)
		addStack.push_back(obj)
		if selected == 'ground':
			Locations.grounds.append(pos)
		if selected == 'platform':
			Locations.platforms.append(pos)
		if selected == 'player':
			Locations.players.append(pos)
		if selected == 'enemy':
			Locations.enemies.append(pos)
		if selected == 'goal':
			Locations.goals.append(pos)
	
func _input(event):
	if event is InputEventMouseButton and event.position.y < 460 and event.position.y > 80:
		if event.is_pressed(): 
			mouse_button_pressed = true
		elif not event.is_pressed():
			mouse_button_pressed = false
			placeObject(event.position)
	
func reset_modulation():
	$Buttons/GroundButton.modulate = Color(1.0,1.0,1.0)
	$Buttons/PlatformButton.modulate = Color(1.0,1.0,1.0)
	$Buttons/PlayerButton.modulate = Color(1.0,1.0,1.0)
	$Buttons/EnemyButton.modulate = Color(1.0,1.0,1.0)
	$Buttons/GoalButton.modulate = Color(1.0,1.0,1.0)

func _on_GroundButton_pressed():
	reset_modulation()
	if selected != 'ground':
		selected = 'ground'
		$Buttons/GroundButton.modulate = Color(2.0,2.0,2.0)
	else:
		selected = ''


func _on_PlatformButton_pressed():
	reset_modulation()
	if selected != 'platform':
		selected = 'platform'
		$Buttons/PlatformButton.modulate = Color(2.0,2.0,2.0)
	else:
		selected = ''
	


func _on_PlayerButton_pressed():
	reset_modulation()
	if selected != 'player':
		selected = 'player'
		$Buttons/PlayerButton.modulate = Color(2.0,2.0,2.0)
	else:
		selected = ''


func _on_EnemyButton_pressed():
	reset_modulation()
	if selected != 'enemy':
		selected = 'enemy'
		$Buttons/EnemyButton.modulate = Color(2.0,2.0,2.0)
	else:
		selected = ''


func _on_StartButton_pressed():
	get_tree().change_scene("res://UI/Place/World.tscn")


func _on_GoalButton_pressed():
	reset_modulation()
	if selected != 'goal':
		selected = 'goal'
		$Buttons/GoalButton.modulate = Color(2.0,2.0,2.0)
	else:
		selected = ''


func _on_UndoButton_pressed():
	if len(addStack) > 0:
		if 'Ground' in addStack[-1].name:
			Locations.grounds.pop_back()
		if 'Player' in addStack[-1].name:
			Locations.players.pop_back()
		if 'Platform' in addStack[-1].name:
			Locations.platforms.pop_back()
		if 'Enemy' in addStack[-1].name:
			Locations.enemies.pop_back()
		if 'Goal' in addStack[-1].name:
			Locations.goals.pop_back()
		print(Locations.grounds)
		addStack[-1].queue_free()
		addStack.pop_back()

		


func _on_ResetButton_pressed():
	Locations.grounds = []
	Locations.platforms = []
	Locations.goals = []
	Locations.enemies = []
	Locations.players = []
	get_tree().change_scene("res://Enemies/BasicEnemy.tscn")
	get_tree().change_scene("res://UI/LevelDesigner.tscn")
