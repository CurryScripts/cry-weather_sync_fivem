RegisterNetEvent("syncEnvironmet")
AddEventHandler("syncEnvironmet", function(response)
    if response.current.rain <= 0 and response.current.rain <= 0 and response.current.showers <= 0 then 
        SetWeatherTypeOverTime("CLEAR", 15.0)
        Wait(15000)
        SetWeatherTypePersist("CLEAR")
        SetWeatherTypeNow("CLEAR")
        SetWeatherTypeNowPersist("CLEAR")
    elseif response.current.rain > 0 or response.current.showers > 0 then
        SetWeatherTypeOverTime("RAIN", 15.0)
        Wait(15000)
        SetWeatherTypePersist("RAIN")
        SetWeatherTypeNow("RAIN")
        SetWeatherTypeNowPersist("RAIN")
    elseif response.current.snowfall > 0 then 
        SetWeatherTypeOverTime("SNOW", 15.0)
        Wait(15000)
        SetWeatherTypePersist("SNOW")
        SetWeatherTypeNow("SNOW")
        SetWeatherTypeNowPersist("SNOW")
    elseif response.current.weather_code == 5 or response.current.weather_code == 6 or response.current.weather_code == 7 or response.current.weather_code == 12 then
        SetWeatherTypeOverTime("SMOG", 15.0)
        Wait(15000) 
        SetWeatherTypePersist("SMOG")
        SetWeatherTypeNow("SMOG")
        SetWeatherTypeNowPersist("SMOG")
    end

    if Config.SyncWind == true then 
        SetWind(response.current.wind_speed_10m)
        SetWindSpeed(response.current.wind_speed_10m)
        SetWindDirection(math.rad(response.current.wind_direction_10m))
    end
end)

