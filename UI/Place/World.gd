extends Node2D



var ground = preload("res://Floors/Ground.tscn")
var platform = preload("res://Floors/Platform.tscn")
var player = preload("res://Player.tscn")
var enemy = preload("res://Enemies/BasicEnemy.tscn")
var goal = preload("res://Goal.tscn")

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		_on_BackButton_pressed()

func _ready():
	for l in Locations.grounds:
		var grd = ground.instance()
		grd.position = l
		add_child(grd)
	for l in Locations.platforms:
		var grd = platform.instance()
		grd.position = l
		add_child(grd)
	for l in Locations.players:
		var grd = player.instance()
		grd.position = l
		add_child(grd)
	for l in Locations.enemies:
		var grd = enemy.instance()
		grd.position = l
		add_child(grd)
	for l in Locations.goals:
		var grd = goal.instance()
		grd.position = l
		add_child(grd)



func _on_BackButton_pressed():
	get_tree().change_scene("res://UI/LevelDesigner.tscn")
