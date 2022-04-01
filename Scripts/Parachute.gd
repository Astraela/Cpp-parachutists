extends Node2D

var fallingSpeed = 8.0
var rotationSway = 30
var rotationSpeed = 0.8
var positionSpeed = -4.0
var randomHorizontalSpeed = 0
var maxHorSpeed = 10
var velocity = Vector2(0,0)
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var nr = rng.randf_range(-1, 1)
	randomHorizontalSpeed = nr* maxHorSpeed
	

func _process(delta):
	var acceleration = Vector2(positionSpeed + randomHorizontalSpeed,fallingSpeed)
	var friction = Vector2(0.1,0.075) * velocity
	acceleration -= friction
	
	velocity += acceleration
	var screensize = get_viewport().get_visible_rect().size
	if(position.x >= screensize.x-10 && randomHorizontalSpeed > 0):
		randomHorizontalSpeed *= -1
	elif(position.x <= 0+10 && randomHorizontalSpeed < 0):
		randomHorizontalSpeed *= -1
	
	rotation_degrees += rotationSpeed
	if((rotation_degrees < -rotationSway && rotationSpeed < 0)|| (rotation_degrees > rotationSway && rotationSpeed > 0)):
		rotationSpeed *= -1
		positionSpeed *= -1
	
	position += velocity * delta
	if(position.y > get_viewport().get_visible_rect().size.y):
		get_tree().get_root().get_node("Node2D/UI/Lives").Hurt()
		queue_free()
