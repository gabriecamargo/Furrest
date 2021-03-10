extends KinematicBody2D

var velocidade = Vector2.ZERO
var rapidez = 100

func _physics_process(delta):
	
	var resultante = Vector2.ZERO #
	resultante.x = Input.get_action_strength("direita") - Input.get_action_strength("esquerda") 
	resultante.y = Input.get_action_strength("baixo") - Input.get_action_strength("cima") 
	resultante = resultante.normalized()
	
	if resultante != Vector2.ZERO:
		velocidade = resultante * rapidez
	else:
		velocidade = Vector2.ZERO
	
	move_and_slide(velocidade)
