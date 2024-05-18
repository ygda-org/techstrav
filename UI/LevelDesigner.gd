extends Control

var selected = ''

var sprites = {'ground' : preload("res://UI/Place/GroundSprite.tscn"), 'player': preload("res://UI/Place/PlayerSprite.tscn"), 'enemy': preload("res://UI/Place/EnemySprite.tscn"), 'platform' : preload("res://UI/Place/PlatformSprite.tscn"), 'goal' : preload('res://UI/Place/GoalSprite.tscn')}

var mouse_button_pressed = false

func _ready():
	for l in Locations.grounds:
		var object = sprites["ground"]
		var obj = object.instance()
		obj.position = l
		add_child(obj)
	for l in Locations.players:
		var object = sprites["player"]
		var obj = object.instance()
		obj.position = l
		add_child(obj)
	for l in Locations.platforms:
		var object = sprites["platform"]
		var obj = object.instance()
		obj.position = l
		add_child(obj)
	for l in Locations.enemies:
		var object = sprites["enemy"]
		var obj = object.instance()
		obj.position = l
		add_child(obj)
	
	
func placeObject(pos):
	if not selected == '':
		var object = sprites[selected]
		var obj = object.instance()
		obj.position = pos
		add_child(obj)
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
	if event is InputEventMouseButton and event.position.y < 460 and not (event.position.x > 400 and event.position.x < 650 and event.position.y > 25 and event.position.y < 100):
		if event.is_pressed(): 
			mouse_button_pressed = true
		elif not event.is_pressed():
			mouse_button_pressed = false
			placeObject(event.position)
	


func _on_GroundButton_pressed():
	selected = 'ground'


func _on_PlatformButton_pressed():
	selected = 'platform'


func _on_PlayerButton_pressed():
	selected = 'player'


func _on_EnemyButton_pressed():
	selected = 'enemy'


func _on_StartButton_pressed():
	get_tree().change_scene("res://UI/Place/World.tscn")


func _on_GoalButton_pressed():
	selected = 'goal'
