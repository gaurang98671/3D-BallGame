extends KinematicBody

var velocity= Vector3(0, 0, 0)
var rotation_speed= -deg2rad(5)
var in_heal=int(0)
var FLOOR_NORMAL= Vector3(0, 1, 0)
var timer

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 0.5
	timer.connect("timeout", self, "_giveDamage")

func _physics_process(delta):
	
	if(Input.is_action_pressed("ui_right")):
		velocity.x=5
		velocity.z=0
		$CollisionShape/MeshInstance.rotate_z(rotation_speed)
	elif(Input.is_action_pressed("ui_left")):
		velocity.x=-5
		velocity.z=0
		$CollisionShape/MeshInstance.rotate_z(-rotation_speed)
	elif(Input.is_action_pressed("ui_up")):
		velocity.z=-5
		velocity.x=0
		$CollisionShape/MeshInstance.rotate_x(rotation_speed)
	elif(Input.is_action_pressed("ui_down")):
		velocity.z=5
		velocity.x=0
		$CollisionShape/MeshInstance.rotate_x(-rotation_speed)
		
	
	else:
		velocity.x=0
		velocity.z=0
		
	if(Input.is_action_pressed("jump")):
		velocity.y= 12 
	if(not is_on_floor()):
		velocity.y-= 30 * delta
	move_and_slide(velocity, FLOOR_NORMAL)
	
	
func _giveDamage():
	if(in_heal==0):
		$Health.value-=1
	else:
		$Health.value+=1

func _on_Area_body_entered(body):
	in_heal=1
	print("Body entered")


func _on_Area_body_exited(body):
	in_heal=0
	


