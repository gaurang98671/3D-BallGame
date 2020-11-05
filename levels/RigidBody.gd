extends RigidBody

var picked= false
var player_near= false


	
func _input(event):
	if Input.is_action_pressed("interact") and player_near and not picked:
		picked=true
		print("Picked")
	elif Input.is_action_pressed("drop") and picked:
		picked= false
		print("Dropped")


func _on_PickArea_body_entered(body: Node) -> void:
	$Label.text= str("Press E to interact")
	player_near=true


func _on_PickArea_body_exited(body: Node) -> void:
	$Label.text= str("")
	player_near= false
