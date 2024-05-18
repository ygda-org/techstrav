extends KinematicBody2D

export (int) var speed = 100

export (int) var gravity = 2000

var velocity = Vector2.ZERO

var dir = 1

var canBounce = true

func _physics_process(delta):
	velocity.x = speed * dir
	if !is_on_floor():
		velocity.x = 0
	if is_on_wall() and canBounce:
		dir *= -1
		$Timer.start()
		canBounce = false
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_PlatformDetector_body_exited(body):
	if body.is_in_group("ground"):
		dir *= -1



func _on_PlatformDetector2_body_exited(body):
	if body.is_in_group("ground"):
		dir *= -1



func _on_PlayerDetector_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene("res://Enemies/BasicEnemy.tscn")
		get_tree().change_scene("res://UI/Place/World.tscn")


func _on_Timer_timeout():
	canBounce = true
