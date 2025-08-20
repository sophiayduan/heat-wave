extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var startPos: Vector2 #store starting position

func _ready():
	startPos = global_position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimationPlayer.stop()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$AnimationPlayer.stop() #stops all animations (you can add a left/right walking anim if you want :D )
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimationPlayer.play('idle') # plays 'idle' animation

	move_and_slide()


func _on_area_2d_fell_off_map() -> void:
	global_position = startPos
