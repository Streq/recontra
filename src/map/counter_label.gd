extends Label

export var format := "ENEMIGOS MUERTOS: %d"

func update_text(val):
	text = format % val
