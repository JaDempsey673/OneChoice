extends CharacterBody2D

const SPEED = 300.0
var canmove = true
var attack = false
signal needsbar

func _ready() -> void:
	$AnimatedSprite2D.play("walking")

func _physics_process(_delta: float) -> void:

	if(canmove):
		velocity.x = SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

func _on_input_flag_hit() -> void:
	$AnimatedSprite2D.stop()
	canmove = false
	needsbar.emit()
	$AnimatedSprite2D.play("idle")

func _on_canvas_layer_canmovenow() -> void:
	attack = true
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.play("attack")
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if(attack):
		attack = false
		canmove = true
		$AnimatedSprite2D.play("walking")
