extends KinematicBody2D

export (int) var speed = 300
export (int) var jump_speed = -450
export (int) var gravity = 2000

var velocity = Vector2.ZERO
export (float, 0, 1.0) var friction = 0.1
export (float, 0, 1.0) var acceleration = 0.25

func get_input():
	var dir = 0
	if Input.is_action_pressed("walk_right"):
		dir += 1
	if Input.is_action_pressed("walk_left"):
		dir -= 1
	if dir != 0:
		velocity.x = dir * speed#lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = 0#lerp(velocity.x, 0, friction)

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
			
func win():
	get_tree().change_scene("res://UI/Win.tscn")
