*** Settings ***
Resource    ../Resources/Variables.robot
Resource    ../Resources/API/openweatherapp_api.robot


*** Test Cases ***
Get weather data with different location methods
    [Tags]    OpenWeatherMap    CityWeather
    #Get OpenWeather Data With City Name
    ${json_data_by_city_name}    openweatherapp_api.Get OpenWeather Data With Params    q=${CITY_NAME}    appid=${APPID}
    openweatherapp_api.Compare Coordinates With Reference    ${json_data_by_city_name}    ${BATUMI_LON}    ${BATUMI_LAT}

    #Get OpenWeather Data With City Id
    ${json_data_by_city_id}    openweatherapp_api.Get OpenWeather Data With Params    id=${CITY_ID}    appid=${APPID}
    BuiltIn.Should Be Equal As Strings    ${json_data_by_city_name}    ${json_data_by_city_id}

    #Get OpenWeather Data With City Coordinates
    ${json_data_by_city_coord}    openweatherapp_api.Get OpenWeather Data With Params    lon=${BATUMI_LON}    lat=${BATUMI_LAT}    appid=${APPID}
    BuiltIn.Should Be Equal As Strings    ${json_data_by_city_name}    ${json_data_by_city_coord}


Get weather data with different units
    [Tags]    OpenWeatherMap    UnitWeather
    ${temperature_kelvin}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${CITY_NAME}    units=standard    appid=${APPID}
    ${temperature_celcius}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${CITY_NAME}    units=metric    appid=${APPID}
    ${temperature_farenheit}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${CITY_NAME}    units=imperial    appid=${APPID}
    ${temperature_invalid_case}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${CITY_NAME}    units=invalid    appid=${APPID}
    ${converted_celsius}    openweatherapp_api.Convert Kelvin to Celsius    ${temperature_kelvin}
    ${converted_farenheit}    openweatherapp_api.Convert Kelvin to Fahrenheit   ${temperature_kelvin}
    BuiltIn.Should Be Equal As Strings    ${temperature_celcius}    ${converted_celsius}
    BuiltIn.Should Be Equal As Strings    ${temperature_farenheit}    ${converted_farenheit}
    BuiltIn.Should Be Equal As Strings    ${temperature_kelvin}    ${temperature_invalid_case}