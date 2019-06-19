extends Sprite

var input_freq = 1
var sample_freq = 5 


var _timer = null
var _timer2 = null
var red = load("res://red_ball.png")
var yellow = load("res://yellow_ball.png")


func _ready():
    _timer = Timer.new()
    _timer2 = Timer.new()
    add_child(_timer)
    add_child(_timer2)
    #texture = red
    #texture = yellow
    _timer2.connect("timeout", self, "_on_Sample")
    _timer2.set_wait_time((1/sample_freq))
    _timer2.set_one_shot(false) # Make sure it loops
    _timer2.start()
	
    _timer.connect("timeout", self, "_on_Timer_timeout")
    _timer.set_wait_time(0.001)
    _timer.set_one_shot(false) # Make sure it loops
    _timer.start()


func _on_Timer_timeout():
    rotation += (360*input_freq)/1000
    texture = yellow 

#func _on_Sample():
	#texture = red
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	rotation +=1
#	pass
