extends Area2D


func _on_Goal_body_entered(body):
	if body.name == 'Player':
		body.win()
