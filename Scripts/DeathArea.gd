extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		await get_tree().create_timer(0.5).timeout
		get_tree().reload_current_scene()
		Global.life -=1
		Global.score =0
		Global.crystal =0
	pass # Replace with function body.
	
