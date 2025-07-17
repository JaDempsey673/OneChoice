extends CharacterBody2D

const SPEED = 300.0
var canmove = true
signal needsbar

func _physics_process(_delta: float) -> void:

	if(canmove):
		velocity.x = SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

func _on_input_flag_hit() -> void:
	canmove = false
	needsbar.emit()

func _on_canvas_layer_canmovenow() -> void:
	canmove = true
