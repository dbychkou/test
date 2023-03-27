*** Keywords ***
Get OpenWeather Data With City Name
    [Arguments]    ${base_url}    ${appid}    ${city_name}
    ${certifi_path}=    Evaluate    certifi.where()
    Create Session      OpenWeatherMap    ${base_url}
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    Remove From Dictionary    ${json_data}    dt
    ${response_lon}         Set Variable    ${json_data['coord']['lon']}
    ${response_lat}                  Set Variable    ${json_data['coord']['lat']}
    Log    ${json_data}
    Log          Lon value is ${response_lon}
    Log          Lat value is ${response_lat}
    [Return]    ${json_data}    ${response_lon}    ${response_lat}


Get OpenWeather Data With City Id
    [Arguments]    ${base_url}    ${appid}    ${city_id}
    ${certifi_path}=    Evaluate    certifi.where()
    Create Session      OpenWeatherMap    ${base_url}
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?id=${city_id}&appid=${appid}    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    Remove From Dictionary    ${json_data}    dt
    Log    ${json_data}
    [Return]    ${json_data}


Get OpenWeather Data With City Coordinates
    [Arguments]    ${base_url}    ${appid}    ${lon}    ${lat}
    ${certifi_path}=    Evaluate    certifi.where()
    Create Session      OpenWeatherMap    ${base_url}
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?lat=${lat}&lon=${lon}&appid=${appid}    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    Remove From Dictionary    ${json_data}    dt
    Log    ${json_data}
    [Return]    ${json_data}


Convert Kelvin to Celsius
    [Arguments]    ${kelvin}
    ${celsius}=    Evaluate    ${kelvin} - 273.15
    ${rounded_celsius}    Convert To Number    ${celsius}    2
    [Return]    ${rounded_celsius}


Convert Kelvin to Fahrenheit
    [Arguments]    ${kelvin}
    ${fahrenheit}=    Evaluate    ${kelvin} * 9/5 - 459.67
    ${rounded_celsius}    Convert To Number    ${fahrenheit}    2
    [Return]    ${rounded_celsius}


Get OpenWeather Temperature In Standard Units
    [Arguments]    ${base_url}    ${appid}
    ${certifi_path}=    Evaluate    certifi.where()
    Create Session      OpenWeatherMap    ${base_url}
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}&units=standard    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    ${kelvin}    Set Variable    ${json_data['main']['temp']}
    [Return]    ${kelvin}


Get OpenWeather Temperature In Metric Units
    [Arguments]    ${base_url}    ${appid}
    ${certifi_path}=    Evaluate    certifi.where()
    Create Session      OpenWeatherMap    ${base_url}
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}&units=metric    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    ${celsius}    Set Variable    ${json_data['main']['temp']}
    [Return]    ${celsius}


Get OpenWeather Temperature In Imperial Units
    [Arguments]    ${base_url}    ${appid}
    ${certifi_path}=    Evaluate    certifi.where()
    Create Session      OpenWeatherMap    ${base_url}
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}&units=imperial    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    ${farenheit}    Set Variable    ${json_data['main']['temp']}
    [Return]    ${farenheit}


Get OpenWeather Temperature Using Invalid Units
    [Arguments]    ${base_url}    ${appid}
    ${certifi_path}=    Evaluate    certifi.where()
    Create Session      OpenWeatherMap    ${base_url}
    ${response}=        GET On Session    OpenWeatherMap    url=/weather?q=${city_name}&appid=${appid}&units=invalid    verify=${certifi_path}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain          ${response.headers['Content-Type']}    application/json
    ${json_data}            Set Variable    ${response.json()}
    ${kelvin_invalid_case}    Set Variable    ${json_data['main']['temp']}
    [Return]    ${kelvin_invalid_case}