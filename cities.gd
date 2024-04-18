extends Control
var cities = ["Burnaby","Vancouver","Seattle","Victoria","Delta","Nanaimo"] #List

func _ready():
	$CityName.text = (Globalvars.cityname)
	for i in cities: #Iterative loop
		$ItemList.add_item(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_selected(index):
	Globalvars.cityname = $ItemList.get_item_text(index)
	$CityName.text = (Globalvars.cityname)
	print(Globalvars.cityname)
