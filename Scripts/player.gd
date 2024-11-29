extends CharacterBody2D

@export var  speed = 160.0
@export var jump_velocity = -300.0

var dir 
var gravity = 980
var damage = false

@onready var animator = $AnimatedSprite2D
@onready var run_particle = $CPUParticles2D

var anim_state

var jumps = 1 

func _physics_process(delta):
	Move(delta)
	Animations()
	
	pass



func Move(delta):
	if damage == false:
		dir = Input.get_axis("Left", "Right")
	if dir :
		velocity.x = dir*speed
	else:
		velocity.x = 0
	
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_velocity

		pass
	
	if Input.is_action_just_pressed("Jump") and jumps > 0:
		jumps -= 1
		velocity.y = jump_velocity
		animator.play("Jump")
	
	
	if is_on_floor():
		jumps =1
	
	
	move_and_slide()
	
	
	pass


func Animations():
	if velocity.x != 0 and is_on_floor() and damage == false:
		animator.play("Run") 
		run_particle.emitting = true
	elif velocity.x == 0 and is_on_floor() and damage == false:
		animator.play("Idle")
		run_particle.emitting = false
	
	
	if not is_on_floor() and jumps >= 1 and damage == false:
		animator.play("Jump")
		run_particle.emitting = false
		
		
	
	if dir >0:
		animator.flip_h = false
	elif dir <0:
		animator.flip_h = true
	
	pass
	

func _on_area_2d_body_entered(body):
	if body.is_in_group("shyguy"):
		body.Hit()
		velocity.y = jump_velocity * 1
	pass # Replace with function body.
