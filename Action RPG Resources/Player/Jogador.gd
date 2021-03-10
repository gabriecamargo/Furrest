extends KinematicBody2D

var velocidade = Vector2.ZERO

const VELOCIDADE_MAX = 120
const ACELERACAO = 500
const ATRITO = 700

func _physics_process(delta):
	
	var resultante = Vector2.ZERO #
	resultante.x = Input.get_action_strength("direita") - Input.get_action_strength("esquerda") 
	resultante.y = Input.get_action_strength("baixo") - Input.get_action_strength("cima") 
	resultante = resultante.normalized()
	
	if resultante != Vector2.ZERO:
		velocidade = velocidade.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO * delta)
	else:
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)
	
	move_and_slide(velocidade)
