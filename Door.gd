extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene("res://level 1.tscn")








func _on_Lever_Is_Active():
	$AnimationPlayer.play("opening")
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("opened")
