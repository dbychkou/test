*** Settings ***
Library    RequestsLibrary
Library  Collections
Resource     ../Resources/API/openweatherapp_api.robot


*** Variables ***
${base_url}     https://api.openweathermap.org/data/2.5
${appid}        45d1a5bfa4a03eb1c7edb0b3574311d8
${city_name}    Batumi
${city_id}      615532
${lon}          41.6359
${lat}          41.6416


*** Test Cases ***
Get weather data with different location method
    [Tags]              OpenWeatherMap, CityWeather
    ${json_data_by_city_name}    ${responce_lon}    ${responce_lat}    Get OpenWeather Data With City Name    ${base_url}    ${appid}    ${city_name}
    Should Be Equal As Strings    ${responce_lon}    ${lon}
    Should Be Equal As Strings    ${responce_lat}    ${lat}

    ${json_data_by_city_id}    Get OpenWeather Data With City Id    ${base_url}    ${appid}    ${city_id}
    Should Be Equal As Strings    ${json_data_by_city_name}    ${json_data_by_city_id}

    ${json_data_by_city_coord}    Get OpenWeather Data With City Coordinates    ${base_url}    ${appid}    ${lon}    ${lat}
    Should Be Equal As Strings    ${json_data_by_city_name}    ${json_data_by_city_coord}


Get weather data with different units
    [Tags]              OpenWeatherMap, UnitWeather
    ${temperature_kelvin}    Get OpenWeather Temperature In Standard Units    ${base_url}    ${appid}
    ${temperature_celcius}    Get OpenWeather Temperature In Metric Units    ${base_url}    ${appid}
    ${temperature_farenheit}    Get OpenWeather Temperature In Imperial Units    ${base_url}    ${appid}
    ${temperature_invalid_case}    Get OpenWeather Temperature Using Invalid Units    ${base_url}    ${appid}
    ${converted_celsius}    Convert Kelvin to Celsius    ${temperature_kelvin}
    ${converted_farenheit}    Convert Kelvin to Fahrenheit   ${temperature_kelvin}
    Should Be Equal As Strings    ${temperature_celcius}    ${converted_celsius}
    Should Be Equal As Strings    ${temperature_farenheit}    ${converted_farenheit}
    Should Be Equal As Strings    ${temperature_kelvin}    ${temperature_invalid_case}