extends KinematicBody2D

var velocidade = Vector2.ZERO
var spd = 1

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocidade.x = spd
	elif Input.is_action_pressed("ui_left"):
		velocidade.x = -spd
	else:
		velocidade.x = 0
	if Input.is_action_pressed("ui_up"):
		velocidade.y = -spd
	elif Input.is_action_pressed("ui_down"):
		velocidade.y = spd
	else: velocidade.y = 0
	
	move_and_collide(velocidade)
