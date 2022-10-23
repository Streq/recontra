extends Label


export (Array, String, MULTILINE) var consignas

export var index_source : NodePath

func _ready() -> void:
	text = consignas[get_node(index_source).index]
