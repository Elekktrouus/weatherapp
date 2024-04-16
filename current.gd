extends Control
@onready var currentdate = Time.get_datetime_dict_from_system()
@onready var day = currentdate
func _ready():
	$CityName.text = (Globalvars.cityname)
	getForecast(Globalvars.cityname, 7)
	var timer = get_tree().create_timer(60)
	while true:
		await timer.timeout
		getForecast(Globalvars.cityname, 7)
func getForecast(cityname, days):
		var requester = HTTPRequest.new()
		add_child(requester)
		requester.request_completed.connect(_on_request_completed)
		requester.request(str("http://api.weatherapi.com/v1/forecast.json?key=", Globalvars.apikey, "&q=", "canada/",cityname, "&days=", days, "&aqi=no&alerts=no"))
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	$CurrentTemp.text = (str(round(json["current"]["temp_c"]))+"°")
	for i in 7:
		$DayDisplay.get_child(i).text = (str(json["forecast"]["forecastday"][i]["date"]))
		$TempDisplay.get_child(i).text = ((str(round(json["forecast"]["forecastday"][i]["day"]["mintemp_c"]))+"°")+" | "+(str(round(json["forecast"]["forecastday"][i]["day"]["maxtemp_c"]))+"°"))
func _process(delta):
	pass
