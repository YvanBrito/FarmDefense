extends HBoxContainer

const HEART_GUI = preload("res://prefabs/UI_elem/heart_gui.tscn")

func setMaxHearts(max: int):
	for i in range(max):
		var heart = HEART_GUI.instantiate()
		add_child(heart)

func updateHearts(currentHealth):
	var hearts = get_children()
	for i in range(hearts.size()):
		print(i)
		if currentHealth >= (i+1)*2:
			hearts[i].update(0)
		elif currentHealth == (i+1)*2-1:
			hearts[i].update(1)
		else:
			hearts[i].update(2)