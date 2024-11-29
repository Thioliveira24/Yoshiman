extends Node2D


func Collected():
	Global.life += 1

	queue_free()
	
	pass


func _on_area_2d_body_entered(body):
	if body.name == "player":
		Collected() 
	pass # Replace with function body.
