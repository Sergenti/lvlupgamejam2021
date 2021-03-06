extends VBoxContainer

"""Animates the credits text alpha - wait, fade in, wait, fade out"""

var timer
var timer2
var _tween
var _tween_out


func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = false
	timer.one_shot = true
	timer.wait_time = 20
	timer.connect("timeout", self, "_timeout")
	
	timer2 = Timer.new()
	add_child(timer2)
	timer2.autostart = false
	timer2.one_shot = true
	timer2.wait_time = 30
	timer2.connect("timeout", self, "_timeout2")
	
	_tween = Tween.new()
	add_child(_tween)
	
	_tween_out = Tween.new()
	add_child(_tween_out)


func _ready() -> void:
	_tween.connect("tween_completed", self, "_on_tween_complete")
	timer.start()


func _timeout():
	fade_in(3)


func fade_in(duration : float) -> void:
	_tween.interpolate_property(self, "modulate:a",
		self.modulate.a, 1, 10,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	_tween.start()


func _on_tween_complete(_object, _key) -> void:
	timer2.start()


func _timeout2() -> void:
	fade_out(3.0)


func fade_out(duration : float) -> void:
	_tween_out.interpolate_property(self, "modulate:a",
		1, 0, duration,
		Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
	_tween_out.start()
