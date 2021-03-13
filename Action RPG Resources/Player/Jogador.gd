extends KinematicBody2D

var velocidade = Vector2.ZERO

const VELOCIDADE_MAX = 100
const ACELERACAO = VELOCIDADE_MAX / 4
const ATRITO = VELOCIDADE_MAX / 4

func _physics_process(delta):
	
	var resultante = Vector2.ZERO #
	resultante.x = Input.get_action_strength("direita") - Input.get_action_strength("esquerda") 
	resultante.y = Input.get_action_strength("baixo") - Input.get_action_strength("cima") 
	resultante = resultante.normalized()
	
	if resultante != Vector2.ZERO:
		velocidade += resultante * ACELERACAO * delta
		velocidade = velocidade.clamped(VELOCIDADE_MAX * delta)
	else:
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)
	
# warning-ignore:return_value_discarded
	move_and_collide(velocidade)
