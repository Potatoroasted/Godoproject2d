extends KinematicBody2D

var speed = 500
var max_speed = 100
var gravity = 300
var friction = 0.5
var jump = 200
var velocity = Vector2.ZERO
var resistance = 0.7

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var movement_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if movement_x != 0:
		velocity.x += movement_x * speed * delta
		velocity.x = clamp(velocity.x, -max_speed, max_speed)
	
	if is_on_floor():
		if movement_x == 0:
			velocity.x = lerp(velocity.x, 0, friction)
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y -= jump
	else:
		if movement_x == 0:
		 velocity.x = lerp(velocity.x, 0, resistance)
		
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
