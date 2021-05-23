extends Area2D

signal Is_Active

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$AnimationPlayer.play("Active")
			yield($AnimationPlayer,"animation_finished")
			$AnimationPlayer.play("idleActive")
			emit_signal("Is_Active")
		else:
			$AnimationPlayer.play("idle")
				
