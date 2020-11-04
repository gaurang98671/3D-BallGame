extends KinematicBody

var velocity= Vector3(0, 0, 0)
var rotation_speed= -deg2rad(5)

func _ready() -> void:
	pass
	
func _physics_process(delta):
	
	if(Input.is_action_pressed("ui_right")):
		velocity.x=5
		$CollisionShape/MeshInstance.rotate_z(rotation_speed)
	elif(Input.is_action_pressed("ui_left")):
		velocity.x=-5
		$CollisionShape/MeshInstance.rotate_z(-rotation_speed)
	elif(Input.is_action_pressed("ui_up")):
		velocity.z=-5
		$CollisionShape/MeshInstance.rotate_x(rotation_speed)
	elif(Input.is_action_pressed("ui_down")):
		velocity.z=5
		$CollisionShape/MeshInstance.rotate_x(-rotation_speed)
	elif(Input.is_action_pressed("jump")):
		velocity.y= 1500 
	else:
		velocity.x=0
		velocity.z=0
	velocity.y= -1000 * delta
	move_and_slide(velocity)
	pass
