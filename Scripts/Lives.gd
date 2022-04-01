extends RichTextLabel


var lives = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Hurt():
	lives -= 1
	bbcode_text = "[right]"+ str(lives) +" LIVES[/right]"
	if(lives < 0):
		get_tree().change_scene("res://GameOver.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
