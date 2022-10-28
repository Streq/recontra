extends Label
signal fully_visible()

export (Array, String,MULTILINE) var consignas

var index = 0

func _ready() -> void:
	randomize()
	index = randi()%consignas.size()
#	index = 5%consignas.size()
	text = consignas[index]
	set_size(Vector2(get_size().x,0))
	
var fully_visible = false
func _physics_process(delta: float) -> void:
	if !fully_visible and percent_visible == 1.0:
		fully_visible = true
		emit_signal("fully_visible")
		
