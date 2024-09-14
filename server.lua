
Citizen.CreateThread(function()
    while true do
        if Config.SyncWeather == true then 
            requestOpenMeteo()
            Citizen.Wait(Config.SyncIntervall * 60000)
        end
    end
end)


function requestOpenMeteo()
    PerformHttpRequest("https://api.open-meteo.com/v1/forecast?latitude="..Config.latitude.."&longitude="..Config.longitude.."&current=temperature_2m,rain,showers,snowfall,weather_code,wind_speed_10m,wind_direction_10m&hourly=temperature_2m&timezone="..Config.TimeZone.."&forecast_days=1", function(errorCode, response, _, errorData)
        if Config.DEBUG then 
            if errorCode == 200 then 
                print("^2OpenMeteo Data successfully loaded, no errors occurred!")
            else
                print("^1Returned error code: " .. tostring(errorCode))
                print("^1Returned error data: " .. tostring(errorData))
            end
        end

        if errorCode == 200 then 
            TriggerClientEvent("syncEnvironmet", -1, json.decode(response))
        end

    end, "GET", "", {["Content-Type"] = "application/json"})
end

