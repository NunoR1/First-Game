extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	$VideoPlayer.show()
	$VideoPlayer.play()
	yield(get_tree().create_timer(7), "timeout")
	$Continue.show()
	yield($Continue, "pressed")
	$Continue.hide()
	$Message.text = "Dodge"
	$Message.show()
	
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _ready():
	$Continue.hide()

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")


func _on_GameOverTimer_timeout():
	$VideoPlayer.hide()
