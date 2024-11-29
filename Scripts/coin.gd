extends Node2D

func _on_area_2d_body_entered(body):
	if body.name == "player":
		Collected() 
	 
	pass 
	
func Collected():
	Global.score += 1

	queue_free()
	
	pass
