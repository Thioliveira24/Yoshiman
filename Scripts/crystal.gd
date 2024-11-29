extends Node2D





func Collected():
	Global.crystal += 1

	queue_free()
	
	pass

func _on_area_2d_body_entered(body):
	if body.name == "player":
		Collected() 
	
	pass 
	
