extends Control
var current = load("res://current.tscn")
var cities = load("res://cities.tscn")
var history = load("res://history.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tab_container_tab_changed(tab):
	if tab == 1:
		if get_tree().root.get_child(0).has_node('History'):
			$History.queue_free()
		if get_tree().root.get_child(0).has_node('Cities'):
			$Cities.queue_free()
		add_child(current.instantiate())
		move_child($Current, 0)
	else:
		if tab == 0:
			if get_tree().root.get_child(0).has_node('Current'):
				$Current.queue_free()
			if get_tree().root.get_child(0).has_node('History'):
				$History.queue_free()
			add_child(cities.instantiate())
			move_child($Cities, 0)
		else:
			if get_tree().root.get_child(0).has_node('Cities'):
				$Cities.queue_free()
			if get_tree().root.get_child(0).has_node('Current'):
				$Current.queue_free()
			add_child(history.instantiate())
			move_child($History, 0)
	
		
		
		
