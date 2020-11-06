extends Spatial


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var anim_player: AnimationPlayer= get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Area_body_entered(body):
	anim_player.play("fade")
