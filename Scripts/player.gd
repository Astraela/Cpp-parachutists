extends Node2D


var speed = 2
var velocity = Vector2.ZERO
var goal = Vector2.ZERO
var parachutist = preload("../Parachutist.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass #Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _input(event):
	if event is InputEventMouseMotion:
		goal.x = get_global_mouse_position().x


func _process(delta):
	var acceleration = Vector2.ZERO
	acceleration.x += (goal.x - position.x) * speed
	var friction =  .2 * acceleration.x
	acceleration.x -= friction
	if(acceleration.x != 0):
		position.x += acceleration.x*delta
		position.x = clamp(position.x,0,get_viewport().get_visible_rect().size.x)
	velocity.x += acceleration.x


func _on_Player_area_entered(area):
	if(area.is_in_group("Parachutists")):
		area.queue_free()
		get_node("../UI/Points").AddOne()
