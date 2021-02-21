extends Node2D

class_name Radio

export(String) var message = ""

onready var sound = $AudioStreamPlayer2D

var _on = true

func _process(delta):
	if _on:
		get_tree().call_group("Ennemies","distracted",global_position)

func activate():
	if _on:
		print("radio stopped")
		sound.stop()
		_on = false
	else:
		sound.play()
		_on = true


func _on_Radio_body_entered(body):
	if body.name == "Player":
		body.canInteract(message,"Radio",self)
	if body is RigidBody2D:
		activate()


func _on_Radio_body_exited(body):
	if body.name == "Player":
		body.resetInteract()
