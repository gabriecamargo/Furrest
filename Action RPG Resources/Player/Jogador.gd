extends KinematicBody2D

var velocidade = Vector2(0,0)
var rapidez = 100
var resultante = Vector2(0,0)

func _physics_process(delta):
	resultante.x = Input.get_action_strength("direita") - Input.get_action_strength("esquerda") 
	resultante.y = Input.get_action_strength("baixo") - Input.get_action_strength("cima") 
	
	if resultante != Vector2(0, 0):
		velocidade = resultante * rapidez
	else:
		velocidade = Vector2(0,0)
	
	move_and_slide(velocidade)
