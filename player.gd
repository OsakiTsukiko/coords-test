extends KinematicBody2D

export var SPEED = 200

func _ready():
	pass

func _physics_process(delta):
	var vel = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		vel += Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		vel += Vector2(1, 0)
	if Input.is_action_pressed("ui_up"):
		vel += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		vel += Vector2(0, 1)

	self.translate(vel.normalized() * delta * SPEED)
