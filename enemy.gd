extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if (body.name == "Player"):
		var y_delta = position.y - body.position.y
		#print(y_delta)
		if (y_delta < 502):
			print('side')
			get_node("/root/Node").decrease_health()
		elif (y_delta > 519):
			print('above')
			
