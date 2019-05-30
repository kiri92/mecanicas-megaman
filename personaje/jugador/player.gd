extends KinematicBody2D

var speed = 200
var jump_speed = 400
var gravity = 400

var distance = Vector2()
var velocity = Vector2()
var direction_x = 0

const FIREBALL = preload("res://bala/fireball.tscn")

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	_move(delta)
	if Input.is_action_pressed("ui_right"):
		if sign($Position2D.position.x)== -1:
			$Position2D.position.x *= -1
	if Input.is_action_pressed("ui_left"):
		if sign($Position2D.position.x)== 1:
			$Position2D.position.x *= -1
	if Input.is_action_just_pressed("ui_accept"):
		var fireball = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position
	
	
func _move(delta):
	
	direction_x = int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	
	
	
	distance.x = speed*delta
	velocity.x = (direction_x*distance.x)/delta
	velocity.y += gravity*delta
	
	move_and_slide(velocity, Vector2(0,-1))
	
	if Input.is_action_just_released("ui_up"):
		velocity.y = 150
	
	if is_on_floor():
		
		velocity.y = 0
		distance.y = 0
		
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -jump_speed
			distance.y = 1

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	