extends Node2D


@export var level = "" 

func _on_area_2d_body_entered(body):
	if body.name == "player":
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file(level)
	
	pass
