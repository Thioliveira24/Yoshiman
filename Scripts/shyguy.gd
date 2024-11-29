extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

@export var speed = 20.0
@export var range = 1
var dirX = -2
var life = 2

func _ready():
	$Timer.wait_time = range
	pass
	
	
func _physics_process(delta):
	
	Move(delta)
	pass
	
	
func Move(delta):
	
	velocity.x = dirX * speed
	move_and_slide()
	
	pass

func ChangeSide():
	if dirX ==1:
		dirX =-1
		anim.flip_h = true
	else:
		dirX =1
		anim.flip_h = false
	
	pass


func _on_timer_timeout():
	ChangeSide()
	pass # Replace with function body.

func Hit():
	anim.play("Hit")
	speed = 0
	life -= 1
	$AnimatedSprite2D.global_position.y +=2
	await get_tree().create_timer(0.4).timeout
	$AnimatedSprite2D.global_position.y -=2
	anim.play("Idle")
	speed = 20
	
	if life <=0:
		queue_free()
	
	pass




func _on_area_2d_body_entered(body):
	if body.name == "player":
		Global.life -=1
		body.damage = true
		if body.global_position.x >= global_position.x: 
			body.velocity.y =body.jump_velocity
			body.velocity.x = -1*120
		else:
			body.velocity.y =body.jump_velocity
			body.velocity.x = 1*120
		body.get_node("AnimatedSprite2D").play ("Hit")
		await get_tree().create_timer(0.4).timeout
		body.damage = false
	pass
