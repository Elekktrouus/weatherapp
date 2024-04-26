extends Control
@onready var currentdate = Time.get_datetime_dict_from_system()
@onready var day = currentdate
@onready var history = "user://history.json"
func _ready():
	$CityName.text = (Globalvars.cityname)
	getForecast(Globalvars.cityname, 7)

func getForecast(cityname, days):
	if $CheckButton.button_pressed:
		$UpdateIn.show()
		var requester = HTTPRequest.new()
		add_child(requester)
		requester.request_completed.connect(_on_request_completed)
		requester.request(str("http://api.weatherapi.com/v1/forecast.json?key=", Globalvars.apikey, "&q=", "canada/",cityname, "&days=", days, "&aqi=no&alerts=no"))
	else:
		$UpdateIn.hide()
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	$CurrentTemp.text = (str(round(json["current"]["temp_c"]))+"°")
	for i in $TempDisplay.get_child_count():
		$DayDisplay.get_child(i).text = (str(json["forecast"]["forecastday"][i]["date"]))
		$TempDisplay.get_child(i).text = ((str(round(json["forecast"]["forecastday"][i]["day"]["mintemp_c"]))+"°")+" | "+(str(round(json["forecast"]["forecastday"][i]["day"]["maxtemp_c"]))+"°"))
func _process(delta):
	if (round($Timer.time_left)) != 1:
		$UpdateIn.text = ("Update in "+str(round($Timer.time_left))+" seconds.")
	else:
		$UpdateIn.text = ("Update in "+str(round($Timer.time_left))+" second.")
func _on_timer_timeout():
	getForecast(Globalvars.cityname, 7)
	$Timer.start()
