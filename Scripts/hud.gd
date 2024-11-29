extends CanvasLayer




func _process(delta):
	
	$Life/LifeText.text = str(Global.life)
	
	$Score/CoinText.text = str(Global.score)
	
	$Cristals/CristalText.text = str(Global.crystal)
	pass


