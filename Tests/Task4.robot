*** Settings ***
Library    RequestsLibrary
Library    Collections

Resource    ../Resources/Variables.robot
Resource    ../Resources/API/openweatherapp_api.robot


*** Test Cases ***
Get weather data with different location methods
    [Tags]    OpenWeatherMap    CityWeather
    #Get OpenWeather Data With City Name
    ${json_data_by_city_name}    openweatherapp_api.Get OpenWeather Data With Params    q=${CITY_NAME}    appid=${APPID}
    Compare Coordinates With Reference    ${json_data_by_city_name}

    #Get OpenWeather Data With City Id
    ${json_data_by_city_id}    openweatherapp_api.Get OpenWeather Data With Params    id=${CITY_ID}    appid=${APPID}
    Should Be Equal As Strings    ${json_data_by_city_name}    ${json_data_by_city_id}

    #Get OpenWeather Data With City Coordinates
    ${json_data_by_city_coord}    openweatherapp_api.Get OpenWeather Data With Params    lon=${LON}    lat=${LAT}    appid=${APPID}
    Should Be Equal As Strings    ${json_data_by_city_name}    ${json_data_by_city_coord}


Get weather data with different units
    [Tags]    OpenWeatherMap    UnitWeather
    ${temperature_kelvin}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${city_name}    units=standard    appid=${appid}
    ${temperature_celcius}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${city_name}    units=metric    appid=${appid}
    ${temperature_farenheit}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${city_name}    units=imperial    appid=${appid}
    ${temperature_invalid_case}    openweatherapp_api.Get OpenWeather Temperature In Specified Units    q=${city_name}    units=invalid    appid=${appid}
    ${converted_celsius}    openweatherapp_api.Convert Kelvin to Celsius    ${temperature_kelvin}
    ${converted_farenheit}    openweatherapp_api.Convert Kelvin to Fahrenheit   ${temperature_kelvin}
    Should Be Equal As Strings    ${temperature_celcius}    ${converted_celsius}
    Should Be Equal As Strings    ${temperature_farenheit}    ${converted_farenheit}
    Should Be Equal As Strings    ${temperature_kelvin}    ${temperature_invalid_case}