extends Node2D



var ground = preload("res://Floors/Ground.tscn")
var platform = preload("res://UI/Place/PlatformSprite.tscn")
var player = preload("res://Player.tscn")
var enemy = preload("res://Enemies/BasicEnemy.tscn")
var goal = preload("res://Goal.tscn")


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

