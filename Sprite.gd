extends Sprite

var input_freq = 1.0
var sample_freq = 2.7


var _input_timer = null
var _sample_timer = null
var amarelo = load("res://amarelo.png")
var cinza = load("res://cinza.png")


func _ready():
    _input_timer = Timer.new()
    _sample_timer = Timer.new()

    add_child(_input_timer)
    add_child(_sample_timer)
    

    _input_timer.connect("timeout", self, "_on_input_timer_timeout")
    _input_timer.set_wait_time(0.02)
    _input_timer.set_one_shot(false) # Make sure it loops
    _input_timer.start()

    var periodo_sample = 1/sample_freq
    _sample_timer.connect("timeout", self, "_on_Sample")
    _sample_timer.set_wait_time(periodo_sample)
    _sample_timer.set_one_shot(false) # Make sure it loops
    _sample_timer.start()

func _on_input_timer_timeout():
	var z = float((PI*2*input_freq)/50)
	rotation += z
	texture = cinza 

func _on_Sample():
   texture = amarelo
  # print(get_position())
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	rotation +=1
#	pass
