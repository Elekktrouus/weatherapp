extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_selected(index):
	Globalvars.cityname = $ItemList.get_item_text(index)
	print(Globalvars.cityname)
