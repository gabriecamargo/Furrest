extends KinematicBody2D

var velocidade = Vector2.ZERO

const VELOCIDADE_MAX = 80
const ACELERACAO = VELOCIDADE_MAX * 6
const ATRITO = ACELERACAO # quanto maior o valor, menor o efeito

func _physics_process(delta):
	
	var resultante = Vector2.ZERO #
	resultante.x = Input.get_action_strength("direita") - Input.get_action_strength("esquerda") 
	resultante.y = Input.get_action_strength("baixo") - Input.get_action_strength("cima") 
	resultante = resultante.normalized()
	
	if resultante != Vector2.ZERO:
		velocidade = velocidade.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO * delta) # a velocidade vai 
	else:
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)
	
	velocidade = move_and_slide(velocidade)
