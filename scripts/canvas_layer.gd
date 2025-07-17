extends CanvasLayer

signal canmovenow
var bar_reducing

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ProgressBar.hide()
	$Button.hide()
	
func _process(_float):
	$ProgressBar.set_value_no_signal($Timer.time_left)

func _on_player_needsbar() -> void:
	$ProgressBar.show()
	$Button.show()
	$Timer.start()

func _on_timer_timeout() -> void:
	$ProgressBar.hide()
	$Button.hide()
	canmovenow.emit()

func _on_button_pressed() -> void:
	$ProgressBar.hide()
	$Button.hide()
	$Timer.stop()
	canmovenow.emit()
	
