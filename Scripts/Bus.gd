extends Node2D


var parachutist = preload("../Parachutist.tscn")
var speed = 30
var padding = 70
var Velocity = Vector2.ZERO
var waitTime = 3
var waitLimit = Vector2(.25,2)
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()


func _process(delta):
	var Acceleration = Vector2.ZERO
	Acceleration.x = speed
	var friction = .05 * Velocity.x
	Acceleration.x -= friction;
	Velocity.x += Acceleration.x
	position.x += Velocity.x * delta
	if((position.x <= 0.0 + padding/1.5 && speed < 0) || (position.x >= get_viewport().get_visible_rect().size.x - padding*3 && speed > 0)):
		speed = speed *-1;
		get_node("Sprite").set_flip_h(speed <= 0)
	
	waitTime -= delta
	if(waitTime <= 0):
		var newP = parachutist.instance()
		newP.position = position + Vector2(0,50)
		waitTime = rng.randf_range(waitLimit.x,waitLimit.y)
		get_tree().get_root().add_child(newP)
	
