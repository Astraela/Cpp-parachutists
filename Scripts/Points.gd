extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func AddOne():
	points += 1
	bbcode_text = "[right]"+ str(points) +" POINTS[/right]"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
