extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CityName.text = (Globalvars.cityname)
	getForecast(Globalvars.cityname, 7)
func getForecast(cityname, days):
	var requester = HTTPRequest.new()
	add_child(requester)
	requester.request_completed.connect(_on_request_completed)
	requester.request(str("http://api.weatherapi.com/v1/forecast.json?key=", Globalvars.apikey, "&q=", cityname, "&days=", days, "&aqi=no&alerts=no"))

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
	
func _process(delta):
	pass
