extends Node

var life = 3
var score = 0
var crystal = 0

func _ready():
	pass



func _process(delta):
	Death()
	
	pass
	
func Death():
	if life <=0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn") 
		life=3
		score =0
		crystal =0
	pass
