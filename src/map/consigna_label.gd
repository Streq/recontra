extends Label


export (Array, String,MULTILINE) var consignas

var index = 0

func _ready() -> void:
	index = randi()%consignas.size()
	text = consignas[index]
