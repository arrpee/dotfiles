#!/bin/sh
get_icon() {
    case $1 in
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13*) icon="";;
        50*) icon="";;
        *) icon="";
    esac

    echo $icon
}

CITY="Mumbai"
UNITS="metric"
SYMBOL="°C"

API="https://api.openweathermap.org/data/2.5"

weather=$(curl -sf "$API/weather?appid=$OWM_KEY&q=$CITY&units=$UNITS")

if [ -n "$weather" ]; then
    weather_desc=$(echo "$weather" | jq -r ".weather[0].main")
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_temp_feels=$(echo "$weather" | jq ".main.feels_like" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo "$(get_icon "$weather_icon")" "$weather_desc" - "$weather_temp$SYMBOL ($weather_temp_feels$SYMBOL)"
fi