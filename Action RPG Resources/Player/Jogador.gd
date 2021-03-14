extends KinematicBody2D

const VELOCIDADE_MAX = 80
const ACELERACAO = VELOCIDADE_MAX * 6
const ATRITO = ACELERACAO # quanto maior o valor, menor o efeito

var velocidade = Vector2.ZERO

onready var animador = $PlayerAnimacao
onready var posicao = $AnimationTree
onready var estado = posicao.get("parameters/playback")

func _physics_process(delta):
	var resultante = Vector2.ZERO #
	resultante.x = Input.get_action_strength("direita") - Input.get_action_strength("esquerda") 
	resultante.y = Input.get_action_strength("baixo") - Input.get_action_strength("cima") 
	resultante = resultante.normalized()
	
	if resultante != Vector2.ZERO:
		posicao.set("parameters/Idle/blend_position", resultante)
		posicao.set("parameters/Run/blend_position", resultante)
		estado.travel("Run")
		velocidade = velocidade.move_toward(resultante * VELOCIDADE_MAX, ACELERACAO * delta) # a velocidade vai 
	else:
		estado.travel("Idle")
		velocidade = velocidade.move_toward(Vector2.ZERO, ATRITO * delta)
	
	velocidade = move_and_slide(velocidade)
